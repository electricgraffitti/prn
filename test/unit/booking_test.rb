# == Schema Information
#
# Table name: bookings
#
#  id                :integer(4)      not null, primary key
#  user_id           :integer(4)
#  suite_id          :integer(4)
#  reference_number  :string(255)
#  arrival_date      :date
#  departure_date    :date
#  approved          :boolean(1)
#  created_at        :datetime
#  updated_at        :datetime
#  adult_count       :string(255)
#  child_count       :string(255)
#  price             :string(255)
#  payment_received  :time
#  additional_adults :string(255)
#  cancelled         :boolean(1)
#  terms             :boolean(1)
#

require 'test_helper'

class BookingTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
