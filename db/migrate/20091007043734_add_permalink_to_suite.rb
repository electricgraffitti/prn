class AddPermalinkToSuite < ActiveRecord::Migration
  def self.up
    add_column :suites, :permalink, :string
  end

  def self.down
    remove_column :suites, :permalink
  end
end
