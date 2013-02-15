require 'capybara'
class CapybaraTest
  def initialize
    Capybara.javascript_driver = :webkit

    puts "driver set."

    Capybara.run_server = false

    @session = Capybara::Session.new(:selenium)
  end

  def inspect_area(area)
    url = "http://home.rm.com/schoolfinder/ShowSchools.aspx?l=#{area}&t=pri"
    @session.visit(url)

    puts 'done url loading'
    filter_button = @session.find_by_id('content_Nearest20Button')
    filter_button.click
    puts 'clicked on the filter'
    search_button = @session.find_by_id('content_lnkFilterSearch')
    search_button.click
    puts 'clicked the search button'

    (0..19).each do |index|
      a_tag = @session.find_by_id("content_lvSchoolSearchResults_lnkViewProfile_#{index}")
      school_url = a_tag['href']
      inspect_school(school_url)
    end

  end

  def inspect_school(school_url)
    puts "Inspecting school :[#{school_url}]..."
  # content_lvQuestions_lvPerformanceIndicators_0_lblValueLabel_0
  # content_lvQuestions_lvPerformanceIndicators_0_lblValueLabel_1
  # content_lvQuestions_lvPerformanceIndicators_0_lblValueLabel_2
  # content_lvQuestions_lvPerformanceIndicators_0_lblValueLabel_3
  # content_lvQuestions_lvPerformanceIndicators_0_lblValueLabel_4
  # content_lvQuestions_lvPerformanceIndicators_0_lblValueLabel_5
  # content_lvQuestions_lvPerformanceIndicators_0_lblValueLabel_6
  end


end

tester = CapybaraTest.new

tester.inspect_area('broxbourne')
tester.inspect_area('berkhamsted')
