require 'active_record'

class AreaSummary < ActiveRecord::Base
  belongs_to :area

  def initialize(
      name,
      average_house_price,
      shortest_journey_duration,
      shortest_journey_changes,
      shortest_journey_frequency,
      shortest_journey_destination_station,
      median_primary_overall_insp_grade_for_school_eff_score,
      median_primary_achievement_score,
      median_primary_pupil_behaviour_and_safety_score,
      median_primary_quality_of_teaching_score,
      median_primary_quality_of_leadership_score,
      mean_primary_overall_insp_grade_for_school_eff_score,
      mean_primary_achievement_score,
      mean_primary_pupil_behaviour_and_safety_score,
      mean_primary_quality_of_teaching_score,
      mean_primary_quality_of_leadership_score,
      median_secondary_overall_insp_grade_for_school_eff_score,
      median_secondary_achievement_score,
      median_secondary_pupil_behaviour_and_safety_score,
      median_secondary_quality_of_teaching_score,
      median_secondary_quality_of_leadership_score,
      mean_secondary_overall_insp_grade_for_school_eff_score,
      mean_secondary_achievement_score,
      mean_secondary_pupil_behaviour_and_safety_score,
      mean_secondary_quality_of_teaching_score,
      mean_secondary_quality_of_leadership_score,
      include_in_school_search,
      school_count
  )
    super(
        :name => name,
        :average_house_price => average_house_price,
        :shortest_journey_duration => shortest_journey_duration,
        :shortest_journey_changes => shortest_journey_changes,
        :shortest_journey_frequency => shortest_journey_frequency,
        :shortest_journey_destination_station => shortest_journey_destination_station,
        :median_primary_overall_insp_grade_for_school_eff_score => median_primary_overall_insp_grade_for_school_eff_score,
        :median_primary_achievement_score => median_primary_achievement_score,
        :median_primary_pupil_behaviour_and_safety_score => median_primary_pupil_behaviour_and_safety_score,
        :median_primary_quality_of_teaching_score => median_primary_quality_of_teaching_score,
        :median_primary_quality_of_leadership_score => median_primary_quality_of_leadership_score,
        :mean_primary_overall_insp_grade_for_school_eff_score  => mean_primary_overall_insp_grade_for_school_eff_score,
        :mean_primary_achievement_score => mean_primary_achievement_score,
        :mean_primary_pupil_behaviour_and_safety_score => mean_primary_pupil_behaviour_and_safety_score,
        :mean_primary_quality_of_teaching_score => mean_primary_quality_of_teaching_score,
        :mean_primary_quality_of_leadership_score => mean_primary_quality_of_leadership_score,
        :median_secondary_overall_insp_grade_for_school_eff_score => median_secondary_overall_insp_grade_for_school_eff_score,
        :median_secondary_achievement_score => median_secondary_achievement_score,
        :median_secondary_pupil_behaviour_and_safety_score => median_secondary_pupil_behaviour_and_safety_score,
        :median_secondary_quality_of_teaching_score => median_secondary_quality_of_teaching_score,
        :median_secondary_quality_of_leadership_score => median_secondary_quality_of_leadership_score,
        :mean_secondary_overall_insp_grade_for_school_eff_score  => mean_secondary_overall_insp_grade_for_school_eff_score,
        :mean_secondary_achievement_score => mean_secondary_achievement_score,
        :mean_secondary_pupil_behaviour_and_safety_score => mean_secondary_pupil_behaviour_and_safety_score,
        :mean_secondary_quality_of_teaching_score => mean_secondary_quality_of_teaching_score,
        :mean_secondary_quality_of_leadership_score => mean_secondary_quality_of_leadership_score,
        :include_in_school_search => include_in_school_search,
        :school_count => school_count
    )

  end
end
