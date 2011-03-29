# == Schema Information
#
# Table name: suites
#
#  id                     :integer(4)      not null, primary key
#  suite_name             :string(255)
#  suite_view             :string(255)
#  resort_id              :integer(4)
#  created_at             :datetime
#  updated_at             :datetime
#  suite_pic_file_name    :string(255)
#  suite_pic_content_type :string(255)
#  suite_pic_file_size    :integer(4)
#  suite_pic_updated_at   :datetime
#  price                  :string(255)
#  additional_adult       :string(255)
#  additional_child       :string(255)
#  suite_disclaimer       :text
#  permalink              :string(255)
#  keywords               :string(255)
#  meta_description       :text
#

require 'test_helper'

class SuiteTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
