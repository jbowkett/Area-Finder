require 'active_record'
require_relative 'Journey'
require_relative 'School'
require_relative 'area_summary'

class Area < ActiveRecord::Base
  has_many :journeys
  has_many :schools
  has_one :areaSummary

  def initialize(name, average_house_price)
    super(:name => name, :average_house_price => average_house_price)
  end

  def add_journey(destination_station, duration, changes, frequency)
    journey = Journey.new(destination_station, duration, changes, frequency)
    journeys << journey
  end

  def add_school(name, address, accepted_gender, start_leave_age, school_type, is_primary,
      overall_inspection_grade_for_school_effectiveness_score,
      achievement_score, pupil_behaviour_and_safety_score,
      quality_of_teaching_score, quality_of_leadership_score,
      date_of_most_recent_inspection,
      distance, school_rm_url, ofsted_url)
    school = School.new(name, address, accepted_gender, start_leave_age, school_type, is_primary,
                        overall_inspection_grade_for_school_effectiveness_score,
                        achievement_score, pupil_behaviour_and_safety_score,
                        quality_of_teaching_score, quality_of_leadership_score,
                        date_of_most_recent_inspection,
                        distance, school_rm_url, ofsted_url)
    schools << school
  end

  def set_summary(shortest_journey)
    summary = AreaSummary.new(name, average_house_price, shortest_journey.duration, shortest_journey.changes,
                                  shortest_journey.frequency, shortest_journey.destination_station,
                                  -1,-2,-3,-4,-5,
                                  -1,-2,-3,-4,-5,
                                  -1,-2,-3,-4,-5,
                                  -1,-2,-3,-4,-5,
                                  true
    )
    self.areaSummary = summary
  end

end


