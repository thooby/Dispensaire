require File.join(Rails.root.to_s,  'config',  'environment')
require 'csv'
namespace 'dispen' do
  desc "Imports professiones and asigns them to tables"
  task :import_profession do
    puts "importing profession"
    @columns = ["id", "Nom"]
    CSV.open(File.join(Rails.root.to_s, 'data', 'professions.csv'), "r", ",") do |row|
      profession = Profession.new :nom => get_value(row, "Nom")
      if profession.save
        puts "Importado profession: #{profession.nom}"
      else
        puts "No se ha importado el profession #{profession.nom}: #{profession.errors.full_messages}"
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
