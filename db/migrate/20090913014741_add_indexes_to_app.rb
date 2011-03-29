class AddIndexesToApp < ActiveRecord::Migration
  def self.up
    add_index :resorts, :resort_location_id
    add_index :activities, :resort_id
    add_index :amenities, :resort_id
    add_index :dinings, :resort_id
    add_index :services, :resort_id
    add_index :suite_specs, :suite_id
    add_index :suites, :resort_id
  end

  def self.down
    remove_index :resorts, :resort_location_id
    remove_index :activities, :resort_id
    remove_index :amenities, :resort_id
    remove_index :dinings, :resort_id
    remove_index :services, :resort_id
    remove_index :suite_specs, :suite_id
    remove_index :suites, :resort_id
  end
end
