# -*- encoding : utf-8 -*-
require File.join(Rails.root.to_s,  'config',  'environment')
require 'csv'
namespace 'dispen' do
  desc "Imports diagnostics and asigns them to tables"
  task :import_diagnostic do
    puts "importing diagnostic"
    @columns = ["id", "Acronime","Description"]
    CSV.open(File.join(Rails.root.to_s, 'data', 'diagnostics.csv'), "r", ",") do |row|
      diagnostic = Diagnostic.new :acronime => get_value(row, "Acronime"),
:description => get_value(row, "Description")
      if diagnostic.save
        puts "Importado diagnostic: #{diagnostic.description}"
      else
        puts "No se ha importado el diagnostic #{diagnostic.description}: #{diagnostic.errors.full_messages}"
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
