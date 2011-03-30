class Commune < ActiveRecord::Base
  attr_accessible :nom
  has_many :patients
end