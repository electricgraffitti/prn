class AddPermalinkToResortLocation < ActiveRecord::Migration
  def self.up
    add_column :resort_locations, :permalink, :string
  end

  def self.down
    remove_column :resort_locations, :permalink
  end
end
