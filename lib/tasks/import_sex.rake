# -*- encoding : utf-8 -*-
require File.join(Rails.root.to_s,  'config',  'environment')
require 'csv'
namespace 'dispen' do
  desc "Imports sexes and asigns them to tables"
  task :import_sex do
    puts "importing sex"
    @columns = ["id", "Description"]
    CSV.open(File.join(Rails.root.to_s, 'data', 'sexes.csv'), "r", ",") do |row|
      sex = Sex.new :description => get_value(row, "Description")
      if sex.save
        puts "Importado sex: #{sex.description}"
      else
        puts "No se ha importado el sex #{sex.description}: #{sex.errors.full_messages}"
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
