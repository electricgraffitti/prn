# == Schema Information
#
# Table name: services
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  resort_id  :integer(4)
#  created_at :datetime
#  updated_at :datetime
#

class Service < ActiveRecord::Base
  
  # associations
  
  belongs_to :resort
  
  # validations
  
  # paperclip
  
  # named scopes
  
  #==========================class methods========================#
  
  
  
  
end
