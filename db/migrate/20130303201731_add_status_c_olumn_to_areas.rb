class AddStatusCOlumnToAreas < ActiveRecord::Migration
  def self.up
    add_column :areas, :status, :string, :default => 'AWAITING SCHOOLS DOWNLOAD'
  end

  def self.down
    remove_column :areas, :status
  end
end
