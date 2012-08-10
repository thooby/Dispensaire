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
    if @ethnie.destroy
      redirect_to ethnies_url, :notice => "La ethnie a eté eliminé."
    else
      mes_info = "Il n'est pas posible eliminer une ethnie sans eliminer ses patients" 
            redirect_to(ethnies_url, :alert => mes_info)

    end
  end
end
