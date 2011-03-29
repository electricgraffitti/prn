class AddPaymentReceivedToBooking < ActiveRecord::Migration
  def self.up
    add_column :bookings, :payment_received, :time
  end

  def self.down
    remove_column :bookings, :payment_received
  end
end
