class AddAreasTable < ActiveRecord::Migration
  def self.up
    create_table :areas do |t|
      t.string  :name
      t.integer  :average_house_price
    end
  end

  def self.down
    drop_table :areas
  end
end
