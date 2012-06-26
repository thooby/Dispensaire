# -*- encoding : utf-8 -*-
require File.join(Rails.root.to_s,  'config',  'environment')
require 'csv'
namespace 'dispen' do
  desc "Imports tipeconsultationes and asigns them to tables"
  task :import_tipeconsultation do
    puts "importing tipeconsultation"
    @columns = ["id", "Tipe"]
    CSV.open(File.join(Rails.root.to_s, 'data', 'tipeconsultations.csv'), "r", ",") do |row|
      tipeconsultation = Tipeconsultation.new :tipe => get_value(row, "Tipe")
      if tipeconsultation.save
        puts "Importado tipeconsultation: #{tipeconsultation.tipe}"
      else
        puts "No se ha importado el tipeconsultation #{tipeconsultation.tipe}: #{tipeconsultation.errors.full_messages}"
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
