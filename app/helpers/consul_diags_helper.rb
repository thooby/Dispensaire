# -*- encoding : utf-8 -*-
module ConsulDiagsHelper
  def lista_diag(table_diag)
    diag_dic=Hash.new(0)
    table_diag.each do |h|
      diag_dic[h.diagnostic_id] += 1
    end
    diag_dic
  end
end
