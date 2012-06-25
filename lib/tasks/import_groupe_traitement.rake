# -*- encoding : utf-8 -*-
require File.join(Rails.root.to_s,  'config',  'environment')
require 'csv'
namespace 'dispen' do
  desc "Imports groupe_traitements and asigns them to tables"
  task :import_groupe_traitement do
    puts "importing groupe_traitement"
    @columns = ["id", "Description"]
    CSV.open(File.join(Rails.root.to_s, 'data', 'groupe_traitements.csv'), "r", ",") do |row|
      groupe_traitement = GroupeTraitement.new :description => get_value(row, "Description")
      if groupe_traitement.save
        puts "Importado groupe_traitement: #{groupe_traitement.description}"
      else
        puts "No se ha importado el groupe_traitement #{groupe_traitement.description}: #{groupe_traitement.errors.full_messages}"
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
