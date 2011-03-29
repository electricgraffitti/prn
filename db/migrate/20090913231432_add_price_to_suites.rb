class AddPriceToSuites < ActiveRecord::Migration
  def self.up
    add_column :suites, :price, :string
  end

  def self.down
    remove_column :suites, :price
  end
end
