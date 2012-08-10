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
    if @commune.save
       format.html { redirect_to(@commune, :notice => 'La commune a eté  creé.') }
       format.xml  { render :xml => @commune, :status => :created, :location => @commune }
     else
       format.html { render :action => "new" }
       format.xml  { render :xml => @commune.errors, :status => :unprocessable_entity }
     end
  end
  
  def edit
  end

  def update
    if @commune.update_attributes(params[:commune])
        format.html { redirect_to(@commune, :notice => 'La commune a eté mis a jour.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @commune.errors, :status => :unprocessable_entity }
      end
  end

  def destroy
    if @commune.destroy
        redirect_to(communes_url, :notice => "La commune a eté eliminé.")
    else
      n_mess = 0
      n_mess += 1 if @commune.villages[0]
      n_mess += 2 if @commune.patients[0]
      mes_info = "Il n'est pas posible eliminer une commune sans eliminer ses " 
      mes_info += case n_mess
        when 1 then "villages"
        when 2 then "patients"
        when 3 then "patients et ses villages"
      end  
      redirect_to(communes_url, :alert => mes_info)
    end
  end
end
