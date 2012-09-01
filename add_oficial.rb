require 'rubygems'
require 'active_record'	 
require 'csv.rb'

ActiveRecord::Base.establish_connection(
	  :adapter  => 'sqlite3',
	  :database => 'db/development.sqlite3',
	  :host     => 'localhost')

class Diagnostic < ActiveRecord::Base
  
end
oficial = Hash.new('')
CSV.foreach("ofitrans.csv") do |fila|
  oficial[fila[0].to_i]=fila[1]
end
diags=Diagnostic.all
diags.each do |d|
  if oficial[d.id] != '' 
    d.diag_official_id = oficial[d.id]
  elsif d.id<61 
    d.diag_official_id = d.id
  else
    d.diag_official_id = 28
  end
  d.save
end
