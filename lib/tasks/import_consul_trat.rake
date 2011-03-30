require File.join(Rails.root.to_s,  'config',  'environment')
require 'csv'
namespace 'dispen' do
  desc "Imports consul_trats and asigns them to tables"
  task :import_consul_trat do
    puts "importing consul_trat"
    @columns = ["id", "Consultation_id","Traitement_id"]
    CSV.open(File.join(Rails.root.to_s, 'data', 'consul_trat.csv'), "r", ",") do |row|
      consul_trat = ConsulTrat.new :consultation_id => get_value(row, "Consultation_id"),:traitement_id => get_value(row, "Traitement_id")
      if consul_trat.save
        puts "Importado consul_trat: #{consul_trat.consultation_id}"

      else
        puts "No se ha importado el consul_trat #{consul_trat.consultation_id}: #{consul_trat.errors.full_messages}"
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
