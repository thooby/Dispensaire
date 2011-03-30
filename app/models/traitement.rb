class Traitement < ActiveRecord::Base
  attr_accessible :groupe_traitement_id, :acronime, :description
  has_many :consul_trats
end
