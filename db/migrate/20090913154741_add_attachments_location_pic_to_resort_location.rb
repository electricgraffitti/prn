class AddAttachmentsLocationPicToResortLocation < ActiveRecord::Migration
  def self.up
    add_column :resort_locations, :location_pic_file_name, :string
    add_column :resort_locations, :location_pic_content_type, :string
    add_column :resort_locations, :location_pic_file_size, :integer
    add_column :resort_locations, :location_pic_updated_at, :datetime
  end

  def self.down
    remove_column :resort_locations, :location_pic_file_name
    remove_column :resort_locations, :location_pic_content_type
    remove_column :resort_locations, :location_pic_file_size
    remove_column :resort_locations, :location_pic_updated_at
  end
end
