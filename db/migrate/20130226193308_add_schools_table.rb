class AddSchoolsTable < ActiveRecord::Migration

  def self.up
    create_table :schools do |t|
      t.string :name
      t.string :address
      t.string :accepted_gender
      t.string :start_leave_age
      t.string :school_type
      t.boolean :is_primary
      t.integer :overall_inspection_grade_for_school_effectiveness_score
      t.integer :achievement_score
      t.integer :pupil_behaviour_and_safety_score
      t.integer :quality_of_teaching_score
      t.integer :quality_of_leadership_score
      t.date    :date_of_most_recent_inspection
      t.float   :distance
      t.string  :school_rm_url
      t.string  :ofsted_url

      t.references :area
    end
  end

  def self.down
    drop_table :schools
  end
end
