class AdjustColumnsForUsers < ActiveRecord::Migration
  def self.up
    
    remove_column :users, :password
    
    add_column :users, :crypted_password, :string
    add_column :users, :password_salt, :string
    add_column :users, :persistence_token, :string
    add_column :users, :last_login_at, :datetime
    
  end

  def self.down
    
    remove_column :users, :crypted_password
    remove_column :users, :password_salt
    remove_column :users, :persistence_token
    remove_column :users, :last_login_at
    
    
    add_column :users, :password, :string
    
  end
end
