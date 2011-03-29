class AddSeoToResort < ActiveRecord::Migration
  def self.up
    add_column :resorts, :keywords, :string
    add_column :resorts, :meta_description, :text
  end

  def self.down
    remove_column :resorts, :meta_description
    remove_column :resorts, :keywords
  end
end
