class AddTermsToBooking < ActiveRecord::Migration
  def self.up
    add_column :bookings, :terms, :boolean
  end

  def self.down
    remove_column :bookings, :terms
  end
end
