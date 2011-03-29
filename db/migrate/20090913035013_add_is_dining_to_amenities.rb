class AddIsDiningToAmenities < ActiveRecord::Migration
  def self.up
    add_column :amenities, :is_dining, :boolean
  end

  def self.down
    remove_column :amenities, :is_dining
  end
end
