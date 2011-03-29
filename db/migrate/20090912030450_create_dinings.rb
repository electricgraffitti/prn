class CreateDinings < ActiveRecord::Migration
  def self.up
    create_table :dinings do |t|
      t.string :name
      t.string :description
      t.integer :resort_id

      t.timestamps
    end
  end

  def self.down
    drop_table :dinings
  end
end
