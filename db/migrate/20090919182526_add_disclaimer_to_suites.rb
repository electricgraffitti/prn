class AddDisclaimerToSuites < ActiveRecord::Migration
  def self.up
    add_column :suites, :suite_disclaimer, :text
  end

  def self.down
    remove_column :suites, :suite_disclaimer
  end
end
