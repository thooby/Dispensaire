class Consultation < ActiveRecord::Base
  attr_accessible :fecha, :patient_id, :tipeconsultation_id, :observation
  belongs_to :patient
  has_many :consul_diags, :dependent => :destroy
  has_many  :consul_trats
  belongs_to :tipeconsultation
  delegate :tipe,
          :to => :tipeconsultation,
          :prefix => true
  delegate :carte_code,
           :nom,
           :prenom,
           :village_nom,
           :commune_nom,
           :profession_nom,
           :ethnie_nom,
           :to => :patient,
           :prefix => true 
  validates_associated :consul_diags
  def new_consul_diag_attributes=(consul_diag_attributes)
    consul_diag_attributes.each do |attributes|
      consul_diags.build(attributes)
    end 
  end

  after_update :save_consul_diags
  def existing_consul_diag_attributes=(consul_diag_attributes) 
    consul_diags.reject(&:new_record?).each do |consul_diag|
      attributes = consul_diag_attributes[consul_diag.id.to_s] 
      if attributes
        consul_diag.attributes = attributes
      else
        consul_diags.delete(consul_diag)
      end 
    end
  end
  def save_consul_diags
    consul_diags.each do |consul_diag|
      consul_diag.save(false) 
    end
  end
end