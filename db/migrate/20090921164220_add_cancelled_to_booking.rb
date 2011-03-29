class AddCancelledToBooking < ActiveRecord::Migration
  def self.up
    add_column :bookings, :cancelled, :boolean
  end

  def self.down
    remove_column :bookings, :cancelled
  end
end
