# -*- encoding : utf-8 -*-
class Ethnie < ActiveRecord::Base
  attr_accessible :nom
  has_many :patients
  validates  :nom, :presence => true
  validates  :nom, :uniqueness => true
  before_destroy :check_for_patient
  def check_for_patient
    unless patients.count == 0
      message_info = "Il n'est pas posible eliminer une ethnie sans eliminer ses patients"
      errors.add(:ethnie, "message_info")
      return false
    end
  end    
  
end
