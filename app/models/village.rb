# -*- encoding : utf-8 -*-
class Village < ActiveRecord::Base
  attr_accessible :nom, :commune_id
  has_many :patients
  belongs_to :commune
  validates  :nom, :presence => true
  validate :must_be_unique
    def must_be_unique
      if self.class.where(nom: nom, commune_id: commune_id).exists?
        errors.add(:base, 'Le pair Commune-Village doit être unique')
      end
    end
    before_destroy :check_for_patient
    def check_for_patient
      unless commune.patients.count == 0
        message_info = "Il n'est pas posible eliminer une commune sans eliminer ses patients"
        errors.add(:commune, "message_info")
        return false
      end
    end    
end
