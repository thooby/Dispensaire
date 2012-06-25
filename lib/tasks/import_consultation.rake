# -*- encoding : utf-8 -*-
require File.join(Rails.root.to_s,  'config',  'environment')
require 'csv'
namespace 'dispen' do
  desc "Imports consultations and asigns them to tables"
  task :import_consultation do
    puts "importing consultation"
    @columns = [ "Fecha","Patient_id","Sex_id","Age","Village_id","Commune_id","Ethnie_id","Profession_id","Tipe_consultation","Observation"]
    CSV.open(File.join(Rails.root.to_s, 'data', 'consultations.csv'), "r", ",") do |row|
      consultation = Consultation.new :fecha => get_value(row, "Fecha"), 
                                      :patient_id => get_value(row, "Patient_id"), 
                                      :sex_id => get_value(row, "Sex_id"), 
                                      :age => get_value(row, "Age"),
                                      :village_id => get_value(row, "Village_id"),
                                      :commune_id => get_value(row, "Commune_id"),
                                      :ethnie_id => get_value(row, "Ethnie_id"),
                                      :profession_id => get_value(row, "Profession_id"),
                                      :tipe_consultation => get_value(row, "Tipe_consultation"),
                                      :observation => get_value(row, "Observation")
      if consultation.save
        puts "Importado consultation: #{consultation.patient_id}"
      else
        puts "No se ha importado el consultation #{consultation.patient_id}: #{consultation.errors.full_messages}"
      end
    end
  end
  
  
  
  
  def get_value(row, col, columns=nil)
    columns ||= @columns
    if columns.nil?
      raise "No sé de que columna coger el valor"
      return
    end
    row[columns.index(col)]
  end
  
end
