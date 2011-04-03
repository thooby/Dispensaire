class Patient < ActiveRecord::Base
  attr_accessible :prenom, :nom, :carte_code, :fecha, :sex_id, :naissance, :village_id, :commune_id, :ethnie_id, :profession_id
  validates  :prenom, :nom, :carte_code, :fecha, :sex_id, :naissance, :village_id, :commune_id, :ethnie_id, :profession_id, :presence => true
  validates  :carte_code, :uniqueness => true
  validates  :naissance,  :numericality => {:greater_than_or_equal_to => 1910}
  belongs_to :sex
  belongs_to  :village
  belongs_to  :commune 
  belongs_to  :profession 
  belongs_to  :ethnie
  has_many :consultations
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
           scope :tranche1, lambda {where('naissance  > ?' ,(Date.today.year-3))}
           scope :tranche2, lambda {where('naissance  > ? and naissance < ?',(Date.today.year-8),(Date.today.year-2))}
           scope :tranche3, lambda {where('naissance  > ? and naissance < ?',(Date.today.year-14),(Date.today.year-7))}
           scope :tranche4, lambda {where('naissance  > ? and naissance < ?',(Date.today.year-18),(Date.today.year-13))}
           scope :tranche5, lambda {where('naissance  > ? and naissance < ?',(Date.today.year-25),(Date.today.year-17))}
           scope :tranche6, lambda {where('naissance < ?',(Date.today.year-24))}
  def self.find_code(carte_code)
    patient = Patient.where("carte_code = ?", carte_code).first
  end
end
