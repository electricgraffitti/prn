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

class ResortLocation < ActiveRecord::Base
  
  sitemap
  
  # associations
  
  has_many :resorts

  # validations
  
  validates_presence_of :resort_title
  validates_presence_of :location_name
  
  # paperclip
  
  has_attached_file :location_pic,
                    :styles => {:thumb => "143x73>", :medium => "220x112>", :banner => "493x250>" },
                    :url  => "/assets/location_pics/:id/:style/:basename.:extension",
                    :path => "/:rails_root/public/assets/location_pics/:id/:style/:basename.:extension"
                    
  
  validates_attachment_presence :location_pic
  validates_attachment_size :location_pic, :less_than => 5.megabytes
  #validates_attachment_content_type :location_pic, :content_type => ['image/jpeg', 'image/png']
  
  
  
  # named scopes
  
  #==========================class methods========================#
  
  def to_param
    "#{id}-#{permalink}"
  end
  
end
