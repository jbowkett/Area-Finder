require 'active_record'
require_relative 'Journey'
require_relative 'School'

class Area < ActiveRecord::Base
  has_many :journeys
  has_many :schools

  def initialize(name, average_house_price)
    super(:name => name, :average_house_price => average_house_price)
  end

  def add_journey(destination_station, duration, changes, frequency)
    journey = Journey.new(destination_station, duration, changes, frequency)
    journeys << journey
  end

  def add_school(name, accepted_gender, start_leave_age, school_type, is_primary,
      overall_inspection_grade_for_school_effectiveness_score,
      achievement_score, pupil_behaviour_and_safety_score,
      quality_of_teaching_score, quality_of_leadership_score,
      date_of_most_recent_inspection,
      distance, school_rm_url, ofsted_url)
    school = School.new(name, accepted_gender, start_leave_age, school_type, is_primary,
                        overall_inspection_grade_for_school_effectiveness_score,
                        achievement_score, pupil_behaviour_and_safety_score,
                        quality_of_teaching_score, quality_of_leadership_score,
                        date_of_most_recent_inspection,
                        distance, school_rm_url, ofsted_url)
    schools << school
  end

end


