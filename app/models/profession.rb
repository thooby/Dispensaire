class Profession < ActiveRecord::Base
  attr_accessible :nom
  has_many :patients

end
