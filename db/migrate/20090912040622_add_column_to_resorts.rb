class AddColumnToResorts < ActiveRecord::Migration
  def self.up
    add_column :resorts, :from_price, :string
  end

  def self.down
    remove_column :resorts, :from_price
  end
end
