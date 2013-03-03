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

    if update_number_of_results_required
      school_urls = []

      (0..19).each do |index|
        a_tag = do_css_find(@session, "#content_lvSchoolSearchResults_lnkViewProfile_#{index}")
        school_urls << a_tag['href'] unless a_tag == nil
      end

      school_urls.each do |school_url|
        inspect_school(area_to_decorate, school_url, is_primary_results)
        sleep(1+rand(30))
      end
    else
      puts 'Cannot download from search url:[#{results_url}]'
    end
  end

  def update_number_of_results_required
    filter_button = do_css_find(@session, '#content_Nearest20Button')
    filter_button.click unless filter_button.nil?
    search_button = do_css_find(@session, '#content_lnkFilterSearch')
    search_button.click unless filter_button.nil?
    !search_button.nil? && !filter_button.nil?
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

    overall_inspection_score = extract_score('content_lvQuestions_lvPerformanceIndicators_0_lblValueLabel_0')
    achievement_score = extract_score('content_lvQuestions_lvPerformanceIndicators_0_lblValueLabel_1')
    behaviour_score = extract_score('content_lvQuestions_lvPerformanceIndicators_0_lblValueLabel_2')
    teaching_score = extract_score('content_lvQuestions_lvPerformanceIndicators_0_lblValueLabel_3')
    leadership_score = extract_score('content_lvQuestions_lvPerformanceIndicators_0_lblValueLabel_4')

    inspection_date = extract_inspection_date
    ofsted_link = extract_ofsted_link

    already_downloaded = area_to_decorate.schools.select{|school|school.name == name}

    area_to_decorate.add_school(name, address, gender, start_leave_age, school_type, is_primary_school,
                                overall_inspection_score, achievement_score, behaviour_score,
                                teaching_score, leadership_score, inspection_date, distance,
                                school_url, ofsted_link) if already_downloaded.empty?
  end

  def extract_score(id_name)
    parent_node = do_xpath_find("//span[@id=\"#{id_name}\"]/../..")
    result = do_css_find(parent_node, '.chart') if !parent_node.nil?
    return result['data-value'] if result
    '-1' # if nothing found
  end

  def do_css_find(parent_node, css_selector)
    result = nil
    begin
      result = parent_node.find(css_selector)
    rescue => e
      puts "cannot find using css :[#{e.message}]"
    end
    result
  end

  def do_xpath_find(x_path)
    to_return = nil
    begin
      to_return = @session.find(:xpath, x_path)
    rescue => e
      puts "cannot find using xpath :[#{e.message}]"
    end
    to_return
  end

  def extract_inspection_date
    parent_node = do_xpath_find("//span[@id=\"content_lvQuestions_lvPerformanceIndicators_0_lblValueLabel_5\"]/../..")
    date_node = do_css_find(parent_node, '.data p') if !parent_node.nil?
    date_str = date_node.text if !date_node.nil?
    !date_str.nil? && date_str != '' ? Date.parse(date_str) : Date.today
  end

  def extract_ofsted_link
    parent_node = do_xpath_find("//span[@id=\"content_lvQuestions_lvPerformanceIndicators_0_lblValueLabel_6\"]/../..")
    result = do_css_find(parent_node, '.data a') if !parent_node.nil?
    return result['href'] if result
    nil # if nothing found
  end

  def get_node_value(node)
    if (node.nil?)
      ''
    else
      node.text
    end

  end

end


#tester = SchoolDownloader.new
#tester.inspect_school(nil, 'http://home.rm.com/SchoolFinder/Search-Result/2032922/London/Alexander-McLeod-Primary-School.aspx', true)
# tester.inspect_area('berkhamsted')
