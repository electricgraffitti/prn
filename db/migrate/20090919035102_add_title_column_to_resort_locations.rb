class AddTitleColumnToResortLocations < ActiveRecord::Migration
  def self.up
    add_column :resort_locations, :resort_title, :string
  end

  def self.down
    remove_column :resort_locations, :resort_title
  end
end
