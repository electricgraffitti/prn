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

class Suite < ActiveRecord::Base
  
  sitemap
  
  after_update :save_specs
  
  # associations
  
  belongs_to :resort
  has_many :bookings
  has_many :users, :through => :bookings
  
  has_many :suite_specs, :class_name => 'SuiteSpec'
  accepts_nested_attributes_for :suite_specs, :allow_destroy => true
  
  
  # validations
  
  validates_presence_of :suite_name
  validates_presence_of :suite_view
  validates_presence_of :price
  validates_presence_of :additional_adult
  validates_presence_of :additional_child
  validates_presence_of :suite_disclaimer
  validates_presence_of :resort_id
  
  
  # paperclip
  
  has_attached_file :suite_pic,
                    :styles => {:thumb => "143x73>", :medium => "220x112>", :banner => "493x250>" },
                    :url  => "/assets/suite_pics/:id/:style/:basename.:extension",
                    :path => "/:rails_root/public/assets/suite_pics/:id/:style/:basename.:extension"
                    
  
  validates_attachment_presence :suite_pic
  validates_attachment_size :suite_pic, :less_than => 5.megabytes
  #validates_attachment_content_type :suite_pic, :content_type => ['image/jpeg', 'image/png']
  
  
  # named scopes
  
  #==========================class methods========================#
  
  def to_param
    "#{id}-#{permalink}"
  end
  
  def suite_suite_specs=(suite_suite_specs)
     suite_suite_specs.each do |s|
       if s[:id].blank?
       suite_specs.build(s)
     else
       suite_spec = suite_specs.detect { |spec| spec.id == s[:id].to_i }
       suite_spec.attributes = s
     end
    end
  end

  def save_specs
   suite_specs.each do |spec|
     if spec.should_destroy?
       spec.destroy
     else
       spec.save(false)
    end
   end
  end
  
end
