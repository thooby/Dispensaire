# -*- encoding : utf-8 -*-
require File.join(Rails.root.to_s,  'config',  'environment')
require 'csv'
namespace 'dispen' do
  desc "Imports villages and asigns them to tables"
  task :import_village do
    puts "importing village"
    @columns = ["id", "Nom","Commune_id"]
    CSV.open(File.join(Rails.root.to_s, 'data', 'villages.csv'), "r", ",") do |row|
      village = Village.new :nom => get_value(row, "Nom"),:commune_id => get_value(row, "Commune_id")
      if village.save
        puts "Importado village: #{village.nom}"
      else
        puts "No se ha importado el village #{village.nom}: #{village.errors.full_messages}"
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
