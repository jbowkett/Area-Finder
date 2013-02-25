class AddJourneysTable < ActiveRecord::Migration
  def self.up
    create_table :journeys do |t|
      t.string :duration
      t.string :destination_station
      t.string :frequency
      t.integer :changes
      #t.integer :area_id
      #t.foreign_key :areas
      t.references :area
    end
  end

  def self.down
    drop_table :journeys
  end
end
