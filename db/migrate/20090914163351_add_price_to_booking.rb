class AddPriceToBooking < ActiveRecord::Migration
  def self.up
    add_column :bookings, :price, :string
  end

  def self.down
    remove_column :bookings, :price
  end
end
