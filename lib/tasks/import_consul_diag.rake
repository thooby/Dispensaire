require File.join(Rails.root.to_s,  'config',  'environment')
require 'csv'
namespace 'dispen' do
  desc "Imports consul_diags and asigns them to tables"
  task :import_consul_diag do
    puts "importing consul_diag"
    @columns = ["id", "Consultation_id","Diagnostic_id"]
    CSV.open(File.join(Rails.root.to_s, 'data', 'consul_diag.csv'), "r", ",") do |row|
      consul_diag = ConsulDiag.new :consultation_id => get_value(row, "Consultation_id"),:diagnostic_id => get_value(row, "Diagnostic_id")
      if consul_diag.save
        puts "Importado consul_diag: #{consul_diag.consultation_id}"

      else
        puts "No se ha importado el consul_diag #{consul_diag.consultation_id}: #{consul_diag.errors.full_messages}"
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
