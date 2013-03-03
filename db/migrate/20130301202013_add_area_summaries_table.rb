class AddAreaSummariesTable < ActiveRecord::Migration
  def self.up
    create_table :area_summaries do |t|
      t.string :name
      t.integer :average_house_price
      t.integer :shortest_journey_duration
      t.integer :shortest_journey_changes
      t.integer :shortest_journey_frequency
      t.integer :shortest_journey_destination_station
      t.float :median_primary_overall_insp_grade_for_school_eff_score
      t.float :median_primary_achievement_score
      t.float :median_primary_pupil_behaviour_and_safety_score
      t.float :median_primary_quality_of_teaching_score
      t.float :median_primary_quality_of_leadership_score
      t.float :mean_primary_overall_insp_grade_for_school_eff_score
      t.float :mean_primary_achievement_score
      t.float :mean_primary_pupil_behaviour_and_safety_score
      t.float :mean_primary_quality_of_teaching_score
      t.float :mean_primary_quality_of_leadership_score
      t.float :median_secondary_overall_insp_grade_for_school_eff_score
      t.float :median_secondary_achievement_score
      t.float :median_secondary_pupil_behaviour_and_safety_score
      t.float :median_secondary_quality_of_teaching_score
      t.float :median_secondary_quality_of_leadership_score
      t.float :mean_secondary_overall_insp_grade_for_school_eff_score
      t.float :mean_secondary_achievement_score
      t.float :mean_secondary_pupil_behaviour_and_safety_score
      t.float :mean_secondary_quality_of_teaching_score
      t.float :mean_secondary_quality_of_leadership_score
      t.boolean :include_in_school_search

      t.references :area
    end
    
  end

  def self.down
    drop_table :area_summaries
  end
end
