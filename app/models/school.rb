require 'active_record'

class School < ActiveRecord::Base
  belongs_to :area

  def initialize(name, address, accepted_gender, start_leave_age, school_type, is_primary,
      overall_inspection_grade_for_school_effectiveness_score,
      achievement_score, pupil_behaviour_and_safety_score,
      quality_of_teaching_score, quality_of_leadership_score,
      date_of_most_recent_inspection,
      distance, school_rm_url, ofsted_url)
    super(:name => name,
          :address => address,
          :accepted_gender => accepted_gender,
          :start_leave_age => start_leave_age,
          :school_type => school_type,
          :is_primary => is_primary,
          :overall_inspection_grade_for_school_effectiveness_score => overall_inspection_grade_for_school_effectiveness_score,
          :achievement_score => achievement_score,
          :pupil_behaviour_and_safety_score => pupil_behaviour_and_safety_score,
          :quality_of_teaching_score => quality_of_teaching_score,
          :quality_of_leadership_score => quality_of_leadership_score,
          :date_of_most_recent_inspection => date_of_most_recent_inspection,
          :distance => distance,
          :school_rm_url => school_rm_url,
          :ofsted_url => ofsted_url
    )

  end
end
