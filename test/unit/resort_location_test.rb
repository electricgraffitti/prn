# == Schema Information
#
# Table name: resort_locations
#
#  id                        :integer(4)      not null, primary key
#  location_name             :string(255)
#  created_at                :datetime
#  updated_at                :datetime
#  location_pic_file_name    :string(255)
#  location_pic_content_type :string(255)
#  location_pic_file_size    :integer(4)
#  location_pic_updated_at   :datetime
#  resort_title              :string(255)
#  permalink                 :string(255)
#  keywords                  :string(255)
#  meta_description          :text
#

require 'test_helper'

class ResortLocationTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
