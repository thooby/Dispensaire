class Motif < ActiveRecord::Base
  attr_accessible :description
  has_many :consul_motifs
  validates  :description, :presence => true
  validates  :description, :uniqueness => true
  
end
