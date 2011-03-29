class AddSeoToResortLocation < ActiveRecord::Migration
  def self.up
    add_column :resort_locations, :keywords, :string
    add_column :resort_locations, :meta_description, :text
  end

  def self.down
    remove_column :resort_locations, :meta_description
    remove_column :resort_locations, :keywords
  end
end
