# -*- encoding : utf-8 -*-
class EthniesController < ApplicationController
  load_and_authorize_resource
  
  def index
  end

  def show
  end

  def new
  end

  def create
    if @ethnie.save
      redirect_to @ethnie, :notice => "Successfully created ethnie."
    else
      render :action => 'new'
    end
  end

  def edit
  end

  def update
    if @ethnie.update_attributes(params[:ethnie])
      redirect_to @ethnie, :notice  => "Successfully updated ethnie."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @ethnie.destroy
    redirect_to ethnies_url, :notice => "Successfully destroyed ethnie."
  end
end
