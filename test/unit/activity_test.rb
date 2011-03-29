# == Schema Information
#
# Table name: activities
#
#  id            :integer(4)      not null, primary key
#  activity_type :string(255)
#  title         :string(255)
#  description   :string(255)
#  resort_id     :integer(4)
#  created_at    :datetime
#  updated_at    :datetime
#

require 'test_helper'

class ActivityTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
