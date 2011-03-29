class AddPermalinkToResort < ActiveRecord::Migration
  def self.up
    add_column :resorts, :permalink, :string
  end

  def self.down
    remove_column :resorts, :permalink
  end
end
