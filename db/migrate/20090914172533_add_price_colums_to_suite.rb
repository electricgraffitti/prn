class AddPriceColumsToSuite < ActiveRecord::Migration
  def self.up
    add_column :suites, :additional_adult, :string
    add_column :suites, :additional_child, :string
  end

  def self.down
    remove_column :suites, :additional_child
    remove_column :suites, :additional_adult
  end
end
