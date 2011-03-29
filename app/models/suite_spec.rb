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

class SuiteSpec < ActiveRecord::Base
  
  # associations
  
  belongs_to :suite
  
  # validations
  
  # paperclip
  
  # named scopes
  
  named_scope :small_list, lambda {|limit| {:limit => limit }}
  
  # virtual attrs
   attr_accessor :should_destroy
  
  #==========================class methods========================#
  
  
  def should_destroy?
    should_destroy.to_i == 1
  end
  
end
