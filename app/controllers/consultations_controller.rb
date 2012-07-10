# -*- encoding : utf-8 -*-
class ConsultationsController < ApplicationController
  load_and_authorize_resource
  
  def show
    respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @consultation }
      end
  end
  def new
    @consultation.consul_diags.build
    @consultation.consul_trats.build
    respond_to do |format|
        format.html # new.html.erb
        format.xml  { render :xml => @consultation }
      end
  end

  def create   
    debugger
    if @consultation.save
      redirect_to consultation_path(@consultation), :notice => "Successfully created consultation."
    else
      debugger
      @patient = Patient.find(params[:consultation][:patient_id])
      render :action => 'new'
    end
  end

  def edit
    @patient = Patient.find(@consultation.patient_id)
  end

  def update
    params[:consultation][:existing_task_attributes] ||= {}
    @consultation = Consultation.find(params[:id])
    if @consultation.update_attributes(params[:consultation])
      redirect_to @consultation, :notice  => "Successfully updated consultation consul_diag et consul_trats."
    else
      @patient = Patient.find(@consultation.patient_id)
      render :action => 'edit'
    end
  end

  def destroy
    @patient = Patient.find(@consultation.patient_id)
    @consultation.destroy
    render :template => 'patients/show', :notice => "Successfully destroyed consultation."
  end
end
