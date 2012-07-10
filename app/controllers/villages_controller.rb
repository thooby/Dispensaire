# -*- encoding : utf-8 -*-
class VillagesController < ApplicationController
  load_and_authorize_resource
  
  def index
  end

  def show
  end

  def new
  end

  def create
    if @village.save
      redirect_to @village, :notice => "Successfully created village."
    else
      render :action => 'new'
    end
  end

  def edit
  end

  def update
    if @village.update_attributes(params[:village])
      redirect_to @village, :notice  => "Successfully updated village."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @village.destroy
    redirect_to villages_url, :notice => "Successfully destroyed village."
  end
end
