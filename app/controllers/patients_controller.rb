class PatientsController < ApplicationController
  def index
    @alfaorig = Array.new(26) {|i| (i+65).chr}
    @alfabeto = Array.new(26) {|i| (i+65).chr}
    @orden = Patient.find(:all, :order => 'nom, carte_code')
    @orden.collect!{|x| x.nom[0].chr.upcase if x.nom[0]}
    @alfabeto.collect!{|x|  (@orden.index(x).to_i/30)+1 if @orden.index(x)}
    @tipoorden = "nom"
    @patients = Patient.paginate :page => params[:page], :order => 'nom ASC, carte_code'
  end

  def show
    @patient = Patient.find(params[:id])
  end
  
  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(params[:patient])
    if @patient.save
      redirect_to @patient, :notice => "Successfully created patient."
    else
      render :action => 'new'
    end
  end

  def edit
    @patient = Patient.find(params[:id])
  end

  def update
    p "xxxxxxxxxxxxxxx"
    @patient = Patient.find(params[:id])
    if @patient.update_attributes(params[:patient])
      redirect_to @patient, :notice  => "Successfully updated patient."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @patient = Patient.find(params[:id])
    @patient.destroy
    redirect_to patients_url, :notice => "Successfully destroyed patient."
  end
end
