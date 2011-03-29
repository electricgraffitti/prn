class AddColumnsToBookings < ActiveRecord::Migration
  def self.up
    add_column :bookings, :adult_count, :string
    add_column :bookings, :child_count, :string
  end

  def self.down
    remove_column :bookings, :child_count
    remove_column :bookings, :adult_count
  end
end
