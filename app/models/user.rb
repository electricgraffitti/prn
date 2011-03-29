# == Schema Information
#
# Table name: users
#
#  id                :integer(4)      not null, primary key
#  created_at        :datetime
#  updated_at        :datetime
#  phone             :string(255)
#  username          :string(255)
#  fullname          :string(255)
#  crypted_password  :string(255)
#  password_salt     :string(255)
#  persistence_token :string(255)
#  last_login_at     :datetime
#  demo_user         :boolean(1)
#

class User < ActiveRecord::Base
  
  acts_as_authentic
  
  has_many :bookings
  has_many :suites, :through => :bookings
  
end
