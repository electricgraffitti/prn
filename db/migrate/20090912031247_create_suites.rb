class CreateSuites < ActiveRecord::Migration
  def self.up
    create_table :suites do |t|
      t.string :suite_name
      t.string :suite_view
      t.integer :resort_id

      t.timestamps
    end
  end

  def self.down
    drop_table :suites
  end
end
