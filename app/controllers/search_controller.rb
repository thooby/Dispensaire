# -*- encoding : utf-8 -*-
class SearchController < ApplicationController
  load_and_authorize_resource
  
  def show 
      @patient = Patient.find_code(params[:q])
      if @patient then
        flash[:notice]=nil
        render :template => '/patients/show.html.erb'
      else
        @alfaorig = Array.new(26) {|i| (i+65).chr}
        @alfabeto = Array.new(26) {|i| (i+65).chr}
        @orden = Patient.find(:all, :order => 'nom, carte_code')
        @orden.collect!{|x| x.nom[0].chr.upcase if x.nom[0]}
        @alfabeto.collect!{|x|  (@orden.index(x).to_i/30)+1 if @orden.index(x)}
        @tipoorden = "nom"
        @cadena = ""
        @patients = Patient.paginate :page => params[:page], :order => 'nom ASC, carte_code'
        flash[:notice] = "#{params[:q]} n'as pas été trouvé "
        render :template => '/patients/index.html.erb'
      end
  end
  
end
