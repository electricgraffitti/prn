class AddIndexesToApp2 < ActiveRecord::Migration
  def self.up
    
    add_index :payment_notifications, :booking_id
    add_index :bookings, :user_id
    add_index :bookings, :suite_id
    add_index :resorts, :name
    add_index :bookings, :reference_number
    
  end

  def self.down
    
    remove_index :payment_notifications, :booking_id
    remove_index :bookings, :user_id
    remove_index :bookings, :suite_id
    remove_index :resorts, :name
    remove_index :bookings, :reference_number 
    
  end
end
