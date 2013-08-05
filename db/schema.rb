# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130805070240) do

  create_table "area_summaries", :force => true do |t|
    t.string  "name"
    t.integer "average_house_price"
    t.integer "shortest_journey_duration"
    t.integer "shortest_journey_changes"
    t.integer "shortest_journey_frequency"
    t.integer "shortest_journey_destination_station"
    t.float   "median_primary_overall_insp_grade_for_school_eff_score"
    t.float   "median_primary_achievement_score"
    t.float   "median_primary_pupil_behaviour_and_safety_score"
    t.float   "median_primary_quality_of_teaching_score"
    t.float   "median_primary_quality_of_leadership_score"
    t.float   "mean_primary_overall_insp_grade_for_school_eff_score"
    t.float   "mean_primary_achievement_score"
    t.float   "mean_primary_pupil_behaviour_and_safety_score"
    t.float   "mean_primary_quality_of_teaching_score"
    t.float   "mean_primary_quality_of_leadership_score"
    t.float   "median_secondary_overall_insp_grade_for_school_eff_score"
    t.float   "median_secondary_achievement_score"
    t.float   "median_secondary_pupil_behaviour_and_safety_score"
    t.float   "median_secondary_quality_of_teaching_score"
    t.float   "median_secondary_quality_of_leadership_score"
    t.float   "mean_secondary_overall_insp_grade_for_school_eff_score"
    t.float   "mean_secondary_achievement_score"
    t.float   "mean_secondary_pupil_behaviour_and_safety_score"
    t.float   "mean_secondary_quality_of_teaching_score"
    t.float   "mean_secondary_quality_of_leadership_score"
    t.boolean "include_in_school_search"
    t.integer "area_id"
    t.integer "school_count"
  end

  create_table "areas", :force => true do |t|
    t.string  "name"
    t.integer "average_house_price"
    t.string  "status",               :default => "AWAITING SCHOOLS DOWNLOAD"
    t.string  "primary_search_url"
    t.string  "secondary_search_url"
  end

  create_table "journeys", :force => true do |t|
    t.integer "duration"
    t.string  "destination_station"
    t.integer "frequency"
    t.integer "changes"
    t.integer "area_id"
  end

  create_table "schools", :force => true do |t|
    t.string  "name"
    t.string  "address"
    t.string  "accepted_gender"
    t.string  "start_leave_age"
    t.string  "school_type"
    t.boolean "is_primary"
    t.integer "overall_inspection_grade_for_school_effectiveness_score"
    t.integer "achievement_score"
    t.integer "pupil_behaviour_and_safety_score"
    t.integer "quality_of_teaching_score"
    t.integer "quality_of_leadership_score"
    t.date    "date_of_most_recent_inspection"
    t.float   "distance"
    t.string  "school_rm_url"
    t.string  "ofsted_url"
    t.integer "area_id"
  end

end
