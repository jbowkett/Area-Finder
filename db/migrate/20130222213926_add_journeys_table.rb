class AddJourneysTable < ActiveRecord::Migration
  def self.up
    create_table :journeys do |t|
      t.integer :duration
      t.string :destination_station
      t.integer :frequency
      t.integer :changes

      t.references :area
    end
  end

  def self.down
    drop_table :journeys
  end
end
