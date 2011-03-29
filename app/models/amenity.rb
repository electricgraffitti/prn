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

class Amenity < ActiveRecord::Base
  
  
  # associations
  belongs_to :resort
  
  # validations
  
  # paperclip
  
  # Virtual Attrs
  attr_accessor :should_destroy
  
  # named scopes
  named_scope :regular, :conditions => {:is_dining => false}
  named_scope :dining, :conditions => {:is_dining => true}
  
  #==========================class methods========================#
  
  def should_destroy?
    should_destroy.to_i == 1
  end
  
end
