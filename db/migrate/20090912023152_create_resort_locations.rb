class CreateResortLocations < ActiveRecord::Migration
  def self.up
    create_table :resort_locations do |t|
      t.string :location_name

      t.timestamps
    end
  end

  def self.down
    drop_table :resort_locations
  end
end
