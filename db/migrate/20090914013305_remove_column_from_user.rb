class RemoveColumnFromUser < ActiveRecord::Migration
  def self.up
    
    remove_column :users, :first_name
    remove_column :users, :last_name
    remove_column :users, :address
    remove_column :users, :email
    
    add_column :users, :username, :string
    add_column :users, :password, :string
    
  end

  def self.down
    
    remove_column :users, :username
    remove_column :users, :password
    
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :address, :string
    add_column :users, :email, :string
    
  end
end
