require File.join(Rails.root.to_s,  'config',  'environment')
require 'csv'
namespace 'dispen' do
  desc "Imports traitements and asigns them to tables"
  task :import_traitement do
    puts "importing traitement"
    @columns = ["id", "Groupe_traitement_id","Acronime","Description"]
    CSV.open(File.join(Rails.root.to_s, 'data', 'traitements.csv'), "r", ",") do |row|
      traitement = Traitement.new :groupe_traitement_id => get_value(row, "Groupe_traitement_id"), 
                                      :acronime => get_value(row, "Acronime"),
                                      :description => get_value(row, "Description")
      if traitement.save
        puts "Importado traitement: #{traitement.description}"
      else
        puts "No se ha importado el traitement #{traitement.description}: #{traitement.errors.full_messages}"
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
