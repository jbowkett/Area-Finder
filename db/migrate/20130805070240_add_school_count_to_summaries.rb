class AddSchoolCountToSummaries < ActiveRecord::Migration
  def self.up
    add_column :area_summaries, :school_count, :integer
  end

  def self.down
    remove_column :area_sumamries, :school_count
  end
end
