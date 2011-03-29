# == Schema Information
#
# Table name: amenities
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  resort_id  :integer(4)
#  created_at :datetime
#  updated_at :datetime
#  is_dining  :boolean(1)
#

require 'test_helper'

class AmenityTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
