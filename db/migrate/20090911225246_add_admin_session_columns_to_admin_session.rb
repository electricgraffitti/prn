class AddAdminSessionColumnsToAdminSession < ActiveRecord::Migration
  def self.up
    add_column :admin_sessions, :username, :string
    add_column :admin_sessions, :password, :string
  end

  def self.down
    remove_column :admin_sessions, :password
    remove_column :admin_sessions, :username
  end
end
