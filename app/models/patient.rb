# -*- encoding : utf-8 -*-
class Patient < ActiveRecord::Base
  attr_accessible :prenom, :nom, :carte_code, :fecha, :sex_id, :naissance, :village_id, :commune_id, :ethnie_id, :profession_id, :mois, :jour, :observation
  validates  :prenom, :nom, :carte_code, :fecha, :sex_id, :naissance, :village_id, :commune_id, :ethnie_id, :profession_id, :presence => true
  validates  :carte_code, :uniqueness => true
  validates  :naissance,  :numericality => {:greater_than_or_equal_to => 1910}
  belongs_to :sex
  belongs_to  :village
  belongs_to  :commune 
  belongs_to  :profession 
  belongs_to  :ethnie
  has_many :consultations 
  before_destroy :check_for_consultation
  delegate :description,
           :to => :sex,
           :prefix => true
  delegate :nom,         
           :to =>:village,
           :prefix => true
  delegate :nom,   
           :to => :commune,
           :prefix => true
  delegate :nom,   
           :to => :profession,
           :prefix => true
  delegate :nom,   
           :to => :ethnie,
           :prefix => true
  scope :tranche1, lambda {where('naissance  > ?' ,(Date.today.year-1))}
  scope :tranche2, lambda {where('naissance  > ? and naissance < ?',(Date.today.year-1),(Date.today.year-5))}
  scope :tranche3, lambda {where('naissance  > ? and naissance < ?',(Date.today.year-5),(Date.today.year-10))}
  scope :tranche4, lambda {where('naissance  > ? and naissance < ?',(Date.today.year-10),(Date.today.year-15))}
  scope :tranche5, lambda {where('naissance  > ? and naissance < ?',(Date.today.year-15),(Date.today.year-26))}
  scope :tranche6, lambda {where('naissance < ?',(Date.today.year-26))}
  
  def self.find_code(carte_code)
    patient = Patient.where("carte_code = ?", carte_code).first
  end
  
  def check_for_consultation
    unless consultations.count == 0
      errors.add(:patient, "Il n'est pas posible eliminer un patient sans eliminer ses consultations")
      return false
    end
  end
  
  
end
