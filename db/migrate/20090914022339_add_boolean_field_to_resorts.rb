class AddBooleanFieldToResorts < ActiveRecord::Migration
  def self.up
    add_column :resorts, :adults_only, :boolean
  end

  def self.down
    remove_column :resorts, :adults_only
  end
end
