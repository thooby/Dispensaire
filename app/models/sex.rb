class Sex < ActiveRecord::Base
  attr_accessible :description
  has_many :patients
  validates  :description, :presence => true
  
end
