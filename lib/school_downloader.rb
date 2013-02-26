require 'capybara'
class SchoolDownloader
  def initialize
    Capybara.javascript_driver = :webkit

    puts "driver set."

    Capybara.run_server = false

    @session = Capybara::Session.new(:selenium)
  end

  def inspect_area(area)
    area_name = area.name.gsub(/ /, '%20')
    inspect_search_results_url(area, "http://home.rm.com/schoolfinder/ShowSchools.aspx?l=#{area_name}&t=pri", true)
    inspect_search_results_url(area, "http://home.rm.com/schoolfinder/ShowSchools.aspx?l=#{area_name}&t=sec", false)
    puts "#{area.name} school inspector complete."
  end

  :private

  def inspect_search_results_url(area_to_decorate, results_url, is_primary_results)
    @session.visit(results_url)

    puts 'Completed results url loading'
    filter_button = @session.find_by_id('content_Nearest20Button')
    filter_button.click
    puts 'clicked on the filter'
    search_button = @session.find_by_id('content_lnkFilterSearch')
    search_button.click
    puts 'clicked the search button'
    school_urls = []

    (0..19).each do |index|
      a_tag = @session.find_by_id("content_lvSchoolSearchResults_lnkViewProfile_#{index}")
      school_urls << a_tag['href']
    end

    school_urls.each do | school_url |
      inspect_school(area_to_decorate, school_url, is_primary_results)
    end
  end

  def inspect_school(area_to_decorate, school_url, is_primary_school)
    puts "Inspecting school :[#{school_url}]..."

    @session.visit(school_url)
    puts 'School loaded.'
    name = get_node_value(@session.find_by_id('content_lvSchoolDetails_lblSchoolName_0'))
    distance = get_node_value(@session.find_by_id('content_lvSchoolDetails_lblDistanceFromSchool_0'))
    address = get_node_value(@session.find_by_id('content_lvSchoolDetails_lblSchoolAddress_0'))
    school_type = get_node_value(@session.find_by_id('content_lvSchoolDetails_lblSchoolType_0'))
    gender = get_node_value(@session.find_by_id('content_lvSchoolDetails_lblSchoolGender_0'))
    start_leave_age = get_node_value(@session.find_by_id('content_lvSchoolDetails_lblSchoolAgeRange_0'))

    area_to_decorate.add_school(name, address, gender, start_leave_age, school_type, is_primary_school,
                                -1, -1, -1, -1, -1, Date.today, distance, school_url, '')

  # content_lvQuestions_lvPerformanceIndicators_0_lblValueLabel_0
  # content_lvQuestions_lvPerformanceIndicators_0_lblValueLabel_1
  # content_lvQuestions_lvPerformanceIndicators_0_lblValueLabel_2
  # content_lvQuestions_lvPerformanceIndicators_0_lblValueLabel_3
  # content_lvQuestions_lvPerformanceIndicators_0_lblValueLabel_4
  # content_lvQuestions_lvPerformanceIndicators_0_lblValueLabel_5
  # content_lvQuestions_lvPerformanceIndicators_0_lblValueLabel_6
  end

  def get_node_value(node)
    if(node.nil?)
      ''
    else
      node.text
    end

  end

end

# tester = SchoolDownloader.new
# tester.inspect_area('broxbourne')
# tester.inspect_area('berkhamsted')
