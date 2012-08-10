# -*- encoding : utf-8 -*-
class ConsulTratsController < ApplicationController
  load_and_authorize_resource
  
  def index    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @consul_trats }
    end 
  end

  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @consul_trat }
    end
  end

  def new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @consul_trat }
    end 
  end

  def create
    if @consul_trat.save
       format.html { redirect_to(@consul_trat, :notice => 'La consul_trat a eté  creé.') }
       format.xml  { render :xml => @consul_trat, :status => :created, :location => @consul_trat }
     else
       format.html { render :action => "new" }
       format.xml  { render :xml => @consul_trat.errors, :status => :unprocessable_entity }
     end
  end
  
  def edit
  end

  def update
    if @consul_trat.update_attributes(params[:consul_trat])
        format.html { redirect_to(@consul_trat, :notice => 'La consul_trat a eté mis a jour.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @consul_trat.errors, :status => :unprocessable_entity }
      end
  end

  def destroy
      if @consul_trat.destroy
        redirect_to(consul_trats_url, :notice => "La consul_trat a eté eliminé.")
      end
    end
end