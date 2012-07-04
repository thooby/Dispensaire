# -*- encoding : utf-8 -*-
class TipeconsultationsController < ApplicationController
  load_and_authorize_resource
  
  def index
    @tipeconsultations = Tipeconsultation.all
  end

  def show
    @tipeconsultation = Tipeconsultation.find(params[:id])
  end

  def new
    @tipeconsultation = Tipeconsultation.new
  end

  def create
    @tipeconsultation = Tipeconsultation.new(params[:tipeconsultation])
    if @tipeconsultation.save
      redirect_to @tipeconsultation, :notice => "Successfully created tipeconsultation."
    else
      render :action => 'new'
    end
  end

  def edit
    @tipeconsultation = Tipeconsultation.find(params[:id])
  end

  def update
    @tipeconsultation = Tipeconsultation.find(params[:id])
    if @tipeconsultation.update_attributes(params[:tipeconsultation])
      redirect_to @tipeconsultation, :notice  => "Successfully updated tipeconsultation."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @tipeconsultation = Tipeconsultation.find(params[:id])
    @tipeconsultation.destroy
    redirect_to tipeconsultations_url, :notice => "Successfully destroyed tipeconsultation."
  end
end
