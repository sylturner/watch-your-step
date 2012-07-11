class Image < ActiveRecord::Base
  attr_accessible :medium_id, :image
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  
  validates_attachment_presence :image
  validates_attachment_size :image, :less_than => 3.megabytes
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png', 'image/gif']
end
