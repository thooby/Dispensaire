# -*- encoding : utf-8 -*-
class ConsulTrat < ActiveRecord::Base
  attr_accessible :consultation_id, :traitement_id
  belongs_to :traitement
  belongs_to :consultation
  
  validates  :traitement_id, :presence => true

  attr_accessor :traitement_name
  
  def traitement_name
    self.traitement.description if self.traitement
  end

  def self.find_trat
    tot_trat=ConsulTrat.all
    trat_dic=Hash.new(0)
    tot_trat.each do |h|
      trat_dic[h.diagnostic_id] += 1
    end
    trat_dic  
  end
end
