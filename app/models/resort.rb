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

class Resort < ActiveRecord::Base
  
  sitemap
  
  after_update :save_amenitites
  
  # associations
  
  belongs_to :resort_location
  has_many :activities, :class_name => 'Activity'
  accepts_nested_attributes_for :activities, :allow_destroy => true
  
  has_many :amenities, :class_name => 'Amenity'
  accepts_nested_attributes_for :amenities, :allow_destroy => true
  
  has_many :services, :class_name => 'Service'
  accepts_nested_attributes_for :services, :allow_destroy => true
  
  has_many :dinings, :class_name => 'Dining'
  accepts_nested_attributes_for :dinings, :allow_destroy => true
  
  has_many :suites, :class_name => 'Suite'
  accepts_nested_attributes_for :suites, :allow_destroy => true
  
  # validations
  
  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :resort_location_id
  validates_presence_of :from_price
  


  
  # paperclip
  
  
  has_attached_file :resort_pic,
                    :styles => {:thumb => "143x73>", :medium => "220x112>", :banner => "493x250>" },
                    :url  => "/assets/resort_pics/:id/:style/:basename.:extension",
                    :path => "/:rails_root/public/assets/resort_pics/:id/:style/:basename.:extension"
                    
  
  validates_attachment_presence :resort_pic
  validates_attachment_size :resort_pic, :less_than => 5.megabytes
  #validates_attachment_content_type :resort_pic, :content_type => ['image/jpeg', 'image/png']
  
  # named scopes
  
  #==========================class methods========================#
  
  def to_param
    "#{id}-#{permalink}"
  end
  
  def resort_amenities=(resort_amenities)
    resort_amenities.each do |am|
      if am[:id].blank?
        amenities.build(am)
      else
        amenity = amenities.detect { |a| a.id == am[:id].to_i }
        amenity.attributes = am
      end
    end
  end
  
  def save_amenitites
    amenities.each do |amen|
      if amen.should_destroy?
        amen.destroy
      else
        amen.save(false)
      end
    end
  end
  
end
