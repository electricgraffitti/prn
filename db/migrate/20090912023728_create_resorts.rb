class CreateResorts < ActiveRecord::Migration
  def self.up
    create_table :resorts do |t|
      t.string :name
      t.text :description
      t.integer :resort_location_id

      t.timestamps
    end
  end

  def self.down
    drop_table :resorts
  end
end
