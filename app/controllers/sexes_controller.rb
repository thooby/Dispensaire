# -*- encoding : utf-8 -*-
class SexesController < ApplicationController
  load_and_authorize_resource
  
  def index
  end

  def show
  end

  def new
  end

  def create
    if @sex.save
      redirect_to @sex, :notice => "Successfully created sex."
    else
      render :action => 'new'
    end
  end

  def edit
  end

  def update
    if @sex.update_attributes(params[:sex])
      redirect_to @sex, :notice  => "Successfully updated sex."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @sex.destroy
    redirect_to sexes_url, :notice => "Successfully destroyed sex."
  end
end
