# == Schema Information
#
# Table name: resorts
#
#  id                      :integer(4)      not null, primary key
#  name                    :string(255)
#  description             :text
#  resort_location_id      :integer(4)
#  created_at              :datetime
#  updated_at              :datetime
#  from_price              :string(255)
#  resort_pic_file_name    :string(255)
#  resort_pic_content_type :string(255)
#  resort_pic_file_size    :integer(4)
#  resort_pic_updated_at   :datetime
#  adults_only             :boolean(1)
#  permalink               :string(255)
#  keywords                :string(255)
#  meta_description        :text
#

require 'test_helper'

class ResortTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
