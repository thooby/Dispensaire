class Tipeconsultation < ActiveRecord::Base
  attr_accessible :tipe
  has_many :consultations
  validates  :tipe, :presence => true
  
end
