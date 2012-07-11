class Prompt < ActiveRecord::Base
  has_paper_trail
  attr_accessible :answer, :question
  belongs_to :medium
end
