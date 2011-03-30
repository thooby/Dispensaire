class ConsulTrat < ActiveRecord::Base
  attr_accessible :consultation_id, :traitement_id
  belongs_to :traitement
  belongs_to :consultation
end
