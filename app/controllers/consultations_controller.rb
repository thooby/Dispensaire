class ConsultationsController < ApplicationController
  def index
     @consultations = Consultation.paginate :page => params[:page], :order => 'fecha ASC, id'
    
     
  end

  def show
    @consultation = Consultation.find(params[:id])
  end

  def new
    @consultation = Consultation.new
    @consultation.consul_diags.build
  end

  def create
    
    @consultation = Consultation.new(params[:consultation]) 
    if @consultation.save
      redirect_to consultation_path, :notice => "Successfully created consultation."
    else
      render :action => 'new'
    end
  end

  def edit
    @consultation = Consultation.find(params[:id])
  end

  def update
    params[:consultation][:existing_task_attributes] ||= {}
    @consultation = Consultation.find(params[:id])
    if @consultation.update_attributes(params[:consultation])
      redirect_to @consultation, :notice  => "Successfully updated consultation et consul_diag."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @consultation = Consultation.find(params[:id])
    @consultation.destroy
    redirect_to consultations_url, :notice => "Successfully destroyed consultation."
  end
end
