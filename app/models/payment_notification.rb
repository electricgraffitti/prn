# == Schema Information
#
# Table name: payment_notifications
#
#  id               :integer(4)      not null, primary key
#  params           :text
#  booking_id       :integer(4)
#  status           :string(255)
#  transaction_id   :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#  payment_fee      :string(255)
#  payment_date     :string(255)
#  payer_email      :string(255)
#  reference_number :string(255)
#  pending_reason   :string(255)
#

class PaymentNotification < ActiveRecord::Base
  
  belongs_to :booking
  serialize :params
  
  after_create :mark_booking_complete
  
  private
  
  def mark_booking_complete
    booking = Booking.find_by_reference_number(params[:invoice])
    if params[:payment_status] == "Completed"
      booking.update_attribute(:payment_received, Time.now)
    end
  end
end
