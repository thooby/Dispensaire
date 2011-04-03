class ConsulTrat < ActiveRecord::Base
  attr_accessible :consultation_id, :traitement_id
  belongs_to :traitement
  belongs_to :consultation
  def self.find_trat
    tot_trat=ConsulTrat.all
    trat_dic=Hash.new(0)
    tot_trat.each do |h|
      trat_dic[h.diagnostic_id] += 1
    end
    trat_dic  
  end
end
