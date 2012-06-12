class Traitement < ActiveRecord::Base
  attr_accessible :groupe_traitement_id, :acronime, :description
  has_many :consul_trats
  belongs_to :groupe_traitement
end
