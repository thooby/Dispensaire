# -*- encoding : utf-8 -*-
class ConsulDiag < ActiveRecord::Base
  attr_accessible :consultation_id, :diagnostic_id
  belongs_to :diagnostic
  belongs_to :consultation
  validates  :diagnostic_id, :presence => true 
  
  attr_accessor :diagnostic_name
  
  def diagnostic_name
    self.diagnostic.description if self.diagnostic
  end
  
  def self.tranch(t,date_report)
    lev = 0
    trozos =[0,12,60,120,240,360]
    niv = (date_report.year - t[0])*12    
    if t[1] then
      niv += (date_report.month - t[1])
    end
    n=0
    trozos.each do |m|
      lev = n if niv > m
      n += 1
    end
    lev
  end
  def self.clasf(lista,date_report)
    reg = []
    levs=[0,0,0,0,0,0]
    old_dia = lista[0][0] 
    lista.each do |p|
      if p[0] > old_dia
        reg << [old_dia,levs]
        old_dia = p[0]
        levs=[0,0,0,0,0,0]        
      end
      levs[tranch([p[1],p[2]],date_report)] += 1 
    end
    reg << [old_dia,levs]
    reg
  end

  def self.find_diag
    date_report=Time.local(2010,12,31)
    lista=[]
    ConsulDiag.joins(:consultation => :patient).select("naissance,mois,diagnostic_id").order("diagnostic_id","naissance","mois").each do |cd|
      lista << [cd.diagnostic_id,cd.naissance,cd.mois]
    end    
    clasf(lista,date_report)   
  end

  def self.find_diag2
    tot_diag=ConsulDiag.all
    diag_dic=Hash.new(0)
    tot_diag.each do |h|
      diag_dic[h.diagnostic_id] += 1
    end
    diag_dic  
  end

end
