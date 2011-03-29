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

require 'test_helper'

class PaymentNotificationTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
