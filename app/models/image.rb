class Image < ActiveRecord::Base
  has_paper_trail
  attr_accessible :medium_id, :image
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  
  validates_attachment_presence :image
  validates_attachment_size :image, :less_than => 3.megabytes
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png', 'image/gif']
  
  belongs_to :medium
  after_save :update_medium

  def update_medium
    self.medium.updated_at = Time.now
    self.medium.save!
  end

end
