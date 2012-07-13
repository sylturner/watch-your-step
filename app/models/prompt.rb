class Prompt < ActiveRecord::Base
  has_paper_trail
  attr_accessible :answer, :question
  belongs_to :medium

  # set the 'updated_at' for the medium
  after_save :update_medium

  def update_medium
    self.medium.updated_at = Time.now
    self.medium.save!
  end

end
