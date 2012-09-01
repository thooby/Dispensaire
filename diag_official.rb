require 'rubygems'
require 'active_record'	 
require 'csv.rb'

ActiveRecord::Base.establish_connection(
	  :adapter  => 'sqlite3',
	  :database => 'db/development.sqlite3',
	  :host     => 'localhost')

class DiagOfficial < ActiveRecord::Base
  
end

CSV.foreach("oficial.csv") do |fila|
  rec_o = DiagOfficial.new
  rec_o.id ,rec_o.official_desc = fila[0],fila[1]
  rec_o.save
  p rec_o
end
