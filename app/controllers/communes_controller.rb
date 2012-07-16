# -*- encoding : utf-8 -*-
class CommunesController < ApplicationController
  load_and_authorize_resource
  
  def index    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @communes }
    end 
  end

  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @commune }
    end 
  end

  def new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @commune }
    end
  end

  def create
    respond_to do |format|
      if @commune.save
        format.html { redirect_to(@commune, :notice => 'La commune a eté creé.') }
        format.xml  { render :xml => @commune, :status => :created, :location => @commune }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @commune.errors, :status => :unprocessable_entity } 
      end
    end  
  end
  
  def edit
  end

  def update
    respond_to do |format|
      if @commune.update_attributes(params[:commune])
        format.html { redirect_to(@commune, :notice => 'La commune a eté mis a jour.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @commune.errors, :status => :unprocessable_entity }
      end
    end  
  end

  def destroy
    if @commune.destroy
        redirect_to(communes_url, :notice => "La commune a eté eliminé.")
    else
        redirect_to(communes_url, :alert => "Il n'est pas posible eliminer une commune sans eliminer ses villages")
    end
  end
end
