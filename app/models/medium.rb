class Medium < ActiveRecord::Base
  attr_accessible :description, :title, :year, :prompts_attributes
  has_many :prompts

  accepts_nested_attributes_for :prompts, :allow_destroy => true
  opinio_subjectum

end
