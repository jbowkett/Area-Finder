require 'active_record'
require_relative 'Journey'
require_relative 'School'
require_relative 'area_summary'

class Area < ActiveRecord::Base
  has_many :journeys
  has_many :schools
  has_one :areaSummary
  STATUS = {:AWAITING_SCHOOLS_DOWNLOAD => 'AWAITING SCHOOLS DOWNLOAD',
            :DUPLICATE => 'DUPLICATE',
            :SCHOOLS_DOWNLOAD_COMPLETE => 'SCHOOLS DOWNLOAD COMPLETE',
            :SCHOOLS_DOWNLOAD_ERROR => 'SCHOOLS DOWNLOAD ERROR',
            :NO_SCHOOLS_DOWNLOAD_ERROR => 'NO SCHOOLS FOUND ERROR'
  }

  def initialize(name, average_house_price)
    super(:name => name, :average_house_price => average_house_price, :status => STATUS[:AWAITING_SCHOOLS_DOWNLOAD])
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
                              AreaSummariser.median_overall_inspection_grade_for_school_effectiveness_score_for(primary_schools),
                              AreaSummariser.median_achievement_score_for(primary_schools),
                              AreaSummariser.median_pupil_behaviour_and_safety_score_for(primary_schools),
                              AreaSummariser.median_quality_of_teaching_score_for(primary_schools),
                              AreaSummariser.median_quality_of_leadership_score_for(primary_schools),
                              AreaSummariser.mean_overall_inspection_grade_for_school_effectiveness_score_for(primary_schools),
                              AreaSummariser.mean_achievement_score_for(primary_schools),
                              AreaSummariser.mean_pupil_behaviour_and_safety_score_for(primary_schools),
                              AreaSummariser.mean_quality_of_teaching_score_for(primary_schools),
                              AreaSummariser.mean_quality_of_leadership_score_for(primary_schools),

                              AreaSummariser.median_overall_inspection_grade_for_school_effectiveness_score_for(secondary_schools),
                              AreaSummariser.median_achievement_score_for(secondary_schools),
                              AreaSummariser.median_pupil_behaviour_and_safety_score_for(secondary_schools),
                              AreaSummariser.median_quality_of_teaching_score_for(secondary_schools),
                              AreaSummariser.median_quality_of_leadership_score_for(secondary_schools),
                              AreaSummariser.mean_overall_inspection_grade_for_school_effectiveness_score_for(secondary_schools),
                              AreaSummariser.mean_achievement_score_for(secondary_schools),
                              AreaSummariser.mean_pupil_behaviour_and_safety_score_for(secondary_schools),
                              AreaSummariser.mean_quality_of_teaching_score_for(secondary_schools),
                              AreaSummariser.mean_quality_of_leadership_score_for(secondary_schools),

                              false,
                              schools.size
    )
    self.areaSummary.delete unless self.areaSummary.nil?
    self.areaSummary = summary
  end

  def primary_schools
    schools.select(&:is_primary)
  end

  def secondary_schools
    schools.reject(&:is_primary)
  end

end


