# -*- encoding : utf-8 -*-
class ConsulDiag < ActiveRecord::Base
  attr_accessible :consultation_id, :diagnostic_id
  belongs_to :diagnostic
  belongs_to :consultation
  validates  :diagnostic_id, :presence => true                                                                                                                              
  
  attr_accessor :diagnostic_name, :diag_type_id
  
  def diagnostic_name
    self.diagnostic.description if self.diagnostic
  end
   
  def diag_type_id
    self.diagnostic.diag_type_id if self.diagnostic
  end
  
  def self.tranch(t,date_report)
    lev = 0
    trozos =[0,12,49,111,169,301]
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

  def self.find_diag(date_ini,date_fin)
    date_report = date_ini
    lista=[]
    ConsulDiag.joins(:consultation => :patient).select("naissance,mois,diagnostic_id").order("diagnostic_id","naissance","mois").where("consultations.fecha>? and consultations.fecha<?",date_ini,date_fin).each do |cd|
      lista << [cd.diagnostic_id,cd.naissance,cd.mois]
    end    
    clasf(lista,date_report)   
  end
  def self.find_diag3(date_ini,date_fin)
     date_report = date_ini
    lista=[]
    ConsulDiag.joins(:diagnostic, :consultation => :patient).select("patients.naissance, patients.mois, 
                      diagnostics.diag_official_id").order("diag_official_id","naissance","mois").where("consultations.fecha>? and consultations.fecha<?",date_ini,date_fin).each do |cd|
      lista << [cd.diag_official_id,cd.naissance,cd.mois]
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
