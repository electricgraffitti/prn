class AddDemoUserToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :demo_user, :boolean
  end

  def self.down
    remove_column :users, :demo_user
  end
end
