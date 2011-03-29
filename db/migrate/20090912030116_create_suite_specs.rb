class CreateSuiteSpecs < ActiveRecord::Migration
  def self.up
    create_table :suite_specs do |t|
      t.integer :suite_id
      t.string :spec

      t.timestamps
    end
  end

  def self.down
    drop_table :suite_specs
  end
end
