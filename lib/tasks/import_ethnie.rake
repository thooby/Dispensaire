# -*- encoding : utf-8 -*-
require File.join(Rails.root.to_s,  'config',  'environment')
require 'csv'
namespace 'dispen' do
  desc "Imports ethniees and asigns them to tables"
  task :import_ethnie do
    puts "importing ethnie"
    @columns = ["id", "Nom"]
    CSV.open(File.join(Rails.root.to_s, 'data', 'ethnies.csv'), "r", ",") do |row|
      ethnie = Ethnie.new :nom => get_value(row, "Nom")
      if ethnie.save
        puts "Importado ethnie: #{ethnie.nom}"
      else
        puts "No se ha importado el ethnie #{ethnie.nom}: #{ethnie.errors.full_messages}"
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
