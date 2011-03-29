class AddSeoToSuite < ActiveRecord::Migration
  def self.up
    add_column :suites, :keywords, :string
    add_column :suites, :meta_description, :text
  end

  def self.down
    remove_column :suites, :meta_description
    remove_column :suites, :keywords
  end
end
