class AddSchoolsSearchUrlsToAreasTable < ActiveRecord::Migration
  def self.up
    add_column :areas, :primary_search_url, :string
    add_column :areas, :secondary_search_url, :string
  end

  def self.down
    remove_column :areas, :primary_search_url
    remove_column :areas, :secondary_search_url
  end
end
