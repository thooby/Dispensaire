# -*- encoding : utf-8 -*-
class Traitement < ActiveRecord::Base
  attr_accessible :groupe_traitement_id, :acronime, :description
  has_many :consul_trats
  belongs_to :groupe_traitement
  validates  :description, :groupe_traitement_id, :presence => true
  validates  :description, :uniqueness => true
end
