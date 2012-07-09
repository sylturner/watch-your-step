class Medium < ActiveRecord::Base
  attr_accessible :description, :title, :year, :prompts_attributes, :comments_attributes
  has_many :prompts
  has_many :comments, :order => 'created_at ASC'

  accepts_nested_attributes_for :prompts, :allow_destroy => true
  accepts_nested_attributes_for :comments, :allow_destroy => true

end
