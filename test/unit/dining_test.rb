# == Schema Information
#
# Table name: dinings
#
#  id          :integer(4)      not null, primary key
#  name        :string(255)
#  description :string(255)
#  resort_id   :integer(4)
#  created_at  :datetime
#  updated_at  :datetime
#

require 'test_helper'

class DiningTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
