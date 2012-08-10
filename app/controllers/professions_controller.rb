# -*- encoding : utf-8 -*-
class ProfessionsController < ApplicationController
  load_and_authorize_resource
  
  def index
  end

  def show
  end

  def new
  end

  def create
    if @profession.save
      redirect_to @profession, :notice => "Successfully created profession."
    else
      render :action => 'new'
    end
  end

  def edit
  end

  def update
    if @profession.update_attributes(params[:profession])
      redirect_to @profession, :notice  => "Successfully updated profession."
    else
      render :action => 'edit'
    end
  end


  def destroy
    if @profession.destroy
      redirect_to professions_url, :notice => "La profession a eté eliminé."
    else
      mes_info = "Il n'est pas posible eliminer une profession sans eliminer ses patients" 
      redirect_to(professions_url, :alert => mes_info)
    end
  end
end
