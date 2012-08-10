# -*- encoding : utf-8 -*-
class TipeconsultationsController < ApplicationController
  load_and_authorize_resource
  
  def index
  end

  def show
  end

  def new
  end

  def create
    if @tipeconsultation.save
      redirect_to @tipeconsultation, :notice => "Successfully created tipeconsultation."
    else
      render :action => 'new'
    end
  end

  def edit
  end

  def update
    if @tipeconsultation.update_attributes(params[:tipeconsultation])
      redirect_to @tipeconsultation, :notice  => "Successfully updated tipeconsultation."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @tipeconsultation.destroy
    redirect_to tipeconsultations_url, :notice => "Successfully destroyed tipeconsultation."
  end
end
