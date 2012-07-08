class Prompt < ActiveRecord::Base
  attr_accessible :answer, :question
  belongs_to :medium
end
