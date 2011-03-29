# == Schema Information
#
# Table name: suite_specs
#
#  id         :integer(4)      not null, primary key
#  suite_id   :integer(4)
#  spec       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class SuiteSpecTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
