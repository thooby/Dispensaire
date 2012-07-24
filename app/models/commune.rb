# -*- encoding : utf-8 -*-
class Commune < ActiveRecord::Base
  attr_accessible :nom
  has_many :patients
  has_many :villages
  validates  :nom, :presence => true
  validates :nom, :uniqueness => true
  before_destroy :check_for_village_and_patient
  def check_for_village_and_patient
    unless villages.count == 0 && patients.count == 0
      message_info = "Il n'est pas posible eliminer une commune sans eliminer ses x"
      message_info += "villages et" if villages.count != 0 
      message_info += " patients" if patients.count != 0 
      errors.add(:commune, "message_info")
      return false
    end
  end
  
end
