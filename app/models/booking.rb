# == Schema Information
#
# Table name: bookings
#
#  id                :integer(4)      not null, primary key
#  user_id           :integer(4)
#  suite_id          :integer(4)
#  reference_number  :string(255)
#  arrival_date      :date
#  departure_date    :date
#  approved          :boolean(1)
#  created_at        :datetime
#  updated_at        :datetime
#  adult_count       :string(255)
#  child_count       :string(255)
#  price             :string(255)
#  payment_received  :time
#  additional_adults :string(255)
#  cancelled         :boolean(1)
#  terms             :boolean(1)
#

class Booking < ActiveRecord::Base
  
  # Associations
  belongs_to :user
  belongs_to :suite
  has_one :payment_notification
  
  # Named Scopes
  named_scope :user_bookings, lambda { |user_id| {:conditions => ["user_id = ?", user_id]}}
  named_scope :small_list, lambda { |limit| {:limit => limit }}
  named_scope :last_created, :order => "created_at DESC"
  named_scope :current_bookings, :include => [{:suite => :resort}], :conditions => ['departure_date >= ?', Date.today]
  named_scope :archived_bookings, :include => {:suite => :resort}, :conditions => ['departure_date <= ?', Date.today]
  named_scope :cancelled_bookings, :include => {:suite => :resort}, :conditions => {:cancelled => true}
  named_scope :approved, :conditions => {:approved => true}
  
  # Validations
  
  validates_presence_of :arrival_date
  validates_presence_of :departure_date
  #validates_acceptance_of :terms, :accept => "1", :message => "You must accept the terms of service"
  
  
  
  
  #-------------------------Class Methods------------------------------#
  
  def paypal_url(return_url, notify_url)
    values = {
      :business => 'paradiseresortsnow@gmail.com',
      :cmd => '_xclick',
      :item_number => self.reference_number,
      :item_name => "#{suite.resort.name} - #{suite.suite_name}",
      :booking_id => self.id,
      :invoice => self.reference_number,
      :amount => self.price,
      :page_style => 'paypal',
      :cancel_return => return_url, 
      :return => return_url,
      :notify_url => notify_url
    } 
    
    "https://www.paypal.com/cgi-bin/webscr?"+values.map {|k,v| "#{k}=#{v}"}.join("&")
  end
  
  
end
