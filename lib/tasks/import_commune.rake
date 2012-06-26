# -*- encoding : utf-8 -*-
require File.join(Rails.root.to_s,  'config',  'environment')
require 'csv'
namespace 'dispen' do
  desc "Imports communees and asigns them to tables"
  task :import_commune do
    puts "importing commune"
    @columns = ["id", "Nom"]
    CSV.open(File.join(Rails.root.to_s, 'data', 'communes.csv'), "r", ",") do |row|
      commune = Commune.new :nom => get_value(row, "Nom")
      if commune.save
        puts "Importado commune: #{commune.nom}"
      else
        puts "No se ha importado el commune #{commune.nom}: #{commune.errors.full_messages}"
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
