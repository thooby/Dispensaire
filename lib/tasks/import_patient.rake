# -*- encoding : utf-8 -*-
require File.join(Rails.root.to_s,  'config',  'environment')
require 'csv'
namespace 'dispen' do
  desc "Imports patients and asigns them to tables"
  task :import_patient do
    puts "importing patient"
    @columns = ["Prenom","Nom","Carte_code", "Fecha",  "Sex_id", "Naissance", "Village_id", "Commune_id", "Ethnie_id", "Profession_id"]
    CSV.open(File.join(Rails.root.to_s, 'data', 'patients.csv'), "r", ",") do |row|
      patient = Patient.new :prenom => get_value(row, "Prenom"), 
                            :nom => get_value(row, "Nom"), 
                            :carte_code => get_value(row, "Carte_code"),
                            :fecha => get_value(row, "Fecha"), 
                            :sex_id => get_value(row, "Sex_id"), 
                            :naissance => get_value(row, "Naissance"), 
                            :village_id => get_value(row, "Village_id"), 
                            :commune_id => get_value(row, "Commune_id"), 
                            :ethnie_id => get_value(row, "Ethnie_id"), 
                            :profession_id => get_value(row, "Profession_id") 
      if patient.save
        puts "Importado patient: #{patient.prenom}"
      else
        puts "No se ha importado el patient #{patient.prenom}: #{patient.errors.full_messages}"
      end
    end
  end
  
  
  
  
  def get_value(row, col, columns=nil)
    columns ||= @columns
    if columns.nil?
      raise "No se de que columna coger el valor"
      return
    end
    row[columns.index(col)]
  end
  
end
