class CreateActivities < ActiveRecord::Migration
  def self.up
    create_table :activities do |t|
      t.string :activity_type
      t.string :title
      t.string :description
      t.integer :resort_id

      t.timestamps
    end
  end

  def self.down
    drop_table :activities
  end
end
