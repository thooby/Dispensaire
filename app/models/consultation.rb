# -*- encoding : utf-8 -*-
class Consultation < ActiveRecord::Base
  attr_accessible :fecha, :patient_id, :tipeconsultation_id, :observation, :motif, :tension_arteriale_haute, :tension_arteriale_basse, :poul, :temperature, :respiration , :poid, :analyse, :consul_diags_attributes, :consul_trats_attributes
  belongs_to :patient
  belongs_to :tipeconsultation
  has_many :consul_diags, :dependent => :destroy
  has_many :consul_trats, :dependent => :destroy

  validates  :fecha, :patient_id, :tipeconsultation_id, :motif, :consul_trats, :consul_diags, :presence => true
  #validates_numericality_of :temperature, :if => "self.temperature.exists?"
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
  
  accepts_nested_attributes_for :consul_diags, :allow_destroy => true
  accepts_nested_attributes_for :consul_trats, :allow_destroy => true
  
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
      consul_diag.save(:validate => false) 
    end
  end
  
  def new_consul_trat_attributes=(consul_trat_attributes)
    consul_trat_attributes.each do |attributes|
      consul_trats.build(attributes)
    end 
  end

  after_update :save_consul_trats
  def existing_consul_trat_attributes=(consul_trat_attributes) 
    consul_trats.reject(&:new_record?).each do |consul_trat|
      attributes = consul_trat_attributes[consul_trat.id.to_s] 
      if attributes
        consul_trat.attributes = attributes
      else
        consul_trats.delete(consul_trat)
      end 
    end
  end
  def save_consul_trats
    consul_trats.each do |consul_trat|
      consul_trat.save(:validate => false) 
    end
  end
end
