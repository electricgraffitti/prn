class AddColumnsToPaymentNotifications < ActiveRecord::Migration
  def self.up
    add_column :payment_notifications, :payment_fee, :string
    add_column :payment_notifications, :payment_date, :string
    add_column :payment_notifications, :payer_email, :string
    add_column :payment_notifications, :reference_number, :string
    add_column :payment_notifications, :pending_reason, :string
  end

  def self.down
    remove_column :payment_notifications, :pending_reason
    remove_column :payment_notifications, :reference_number
    remove_column :payment_notifications, :payer_email
    remove_column :payment_notifications, :payment_date
    remove_column :payment_notifications, :payment_fee
  end
end
