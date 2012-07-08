class Comment < ActiveRecord::Base
  attr_accessible :author, :comment, :medium_id
  belongs_to :medium
  validates_presence_of :author, :comment, :medium
end
