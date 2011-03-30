class ConsulDiag < ActiveRecord::Base
  attr_accessible :consultation_id, :diagnostic_id
  belongs_to :diagnostic
  belongs_to :consultation
  def self.find_diag
    tot_diag=ConsulDiag.all
    diag_dic=Hash.new(0)
    tot_diag.each do |h|
      diag_dic[h.diagnostic_id] += 1
    end
    diag_dic  
  end

end
