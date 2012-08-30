require 'rubygems'
require 'active_record'	 
require 'csv.rb'

ActiveRecord::Base.establish_connection(
	  :adapter  => 'sqlite3',
	  :database => 'db/development.sqlite3',
	  :host     => 'localhost')

class Motif < ActiveRecord::Base
  
end

CSV.foreach("motif.csv") do |fila|
  rec_motif = Motif.new
  rec_motif.id ,rec_motif.description = fila[0],fila[1]
  rec_motif.save
  p rec_motif
end
