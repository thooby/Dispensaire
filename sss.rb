# support multiple ruby version (fat binaries under windows)
begin
  RUBY_VERSION =~ /(\d+\.\d+)/
  require "sqlite3/#{$1}/sqlite3_native"
rescue LoadError
  require 'sqlite3/sqlite3_native'
end

require 'sqlite3/database'
require 'sqlite3/version'
$LOAD_PATH.unshift "#{File.dirname(__FILE__)}/../lib"
require 'active_record'

class Patient < ActiveRecord::Base
  establish_connection :adapter => 'sqlite3', :database => 'db/development.sqlite3.new'
#  connection.create_table table_name, :force => true do |t|
#    t.string :name
#  end
end



lista = Patient.all
lista.each do |h|
#  h.carte_code=~/([0-9]*)/
#  puts $1
puts h.carte_code
end
