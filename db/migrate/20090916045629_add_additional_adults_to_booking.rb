class AddAdditionalAdultsToBooking < ActiveRecord::Migration
  def self.up
    add_column :bookings, :additional_adults, :string
  end

  def self.down
    remove_column :bookings, :additional_adults
  end
end
