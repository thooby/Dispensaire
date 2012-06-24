class Commune < ActiveRecord::Base
  attr_accessible :nom
  has_many :patients
  has_many :villages
  validates  :nom, :presence => true
  validates :nom, :uniqueness => true
end