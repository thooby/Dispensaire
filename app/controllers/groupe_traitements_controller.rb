# -*- encoding : utf-8 -*-
class GroupeTraitementsController < ApplicationController
  load_and_authorize_resource
  
  def index
  end

  def show
  end

  def new
  end

  def create
    if @groupe_traitement.save
      redirect_to @groupe_traitement, :notice => "Successfully created groupe traitement."
    else
      render :action => 'new'
    end
  end

  def edit
  end

  def update
    if @groupe_traitement.update_attributes(params[:groupe_traitement])
      redirect_to @groupe_traitement, :notice  => "Successfully updated groupe traitement."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @groupe_traitement.destroy
    redirect_to groupe_traitements_url, :notice => "Successfully destroyed groupe traitement."
  end
end
