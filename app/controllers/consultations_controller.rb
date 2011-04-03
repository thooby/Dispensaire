class ConsultationsController < ApplicationController
  def show
    @consultation = Consultation.find(params[:id])
  end

  def new
    @patient = Patient.find(params[:id])
    @consultation = Consultation.new
    @consultation.consul_diags.build
    @consultation.consul_trats.build
  end

  def create
    
    @consultation = Consultation.new(params[:consultation]) 
    if @consultation.save
      redirect_to consultation_path(@consultation), :notice => "Successfully created consultation."
    else
      render :action => 'new'
    end
  end

  def edit
    @consultation = Consultation.find(params[:id])
    @patient = Patient.find(@consultation.patient_id)
    p "++++++++++++++"
  end

  def update
       p "*************"
    params[:consultation][:existing_task_attributes] ||= {}
    @consultation = Consultation.find(params[:id])
    p "*************"
    if @consultation.update_attributes(params[:consultation])
      p "?????????????"
      redirect_to @consultation, :notice  => "Successfully updated consultation consul_diag et consul_trats."
    else
      p "KKKKKKKKKKKKKKK"
      render :action => 'edit'
    end
  end

  def destroy
    @consultation = Consultation.find(params[:id])
    @patient = Patient.find(@consultation.patient_id)
    @consultation.destroy
    render :template => "/patients/show.html.erb", :notice => "Successfully destroyed consultation."
  end
end
