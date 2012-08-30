# -*- encoding : utf-8 -*-
class ConsulMotif < ActiveRecord::Base
  attr_accessible :consultation_id, :motif_id
  belongs_to :motif
  belongs_to :consultation

  #validates  :consultation_id, :presence => true
  validates  :motif_id, :presence => true
  attr_accessor :motif_name
  
  def motif_name
    self.motif.description if self.motif
  end
  def self.find_motif
    tot_motif=ConsulMotif.all
    motif_dic=Hash.new(0)
    tot_motif.each do |h|
      motif_dic[h.motif_id] += 1
    end
    motif_dic  
  end
end
