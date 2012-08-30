# -*- encoding : utf-8 -*-
class ConsulMotifsController < ApplicationController
  load_and_authorize_resource
  
  def index
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @consul_motifs }
    end
 
  end
  def find
   @find_motifs = ConsulMotif.find_motif
   respond_to do |format|
     format.html # show.html.erb
     format.xml  { render :xml => @consul_motif }
   end
 end

  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @consul_motif }
    end
 
  end

  def new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @consul_motif }
    end
 
  end

  def create
    if @consul_motif.save
       format.html { redirect_to(@consul_motif, :notice => 'La consul_motif a eté  creé.') }
       format.xml  { render :xml => @consul_motif, :status => :created, :location => @consul_motif }
     else
       format.html { render :action => "new" }
       format.xml  { render :xml => @consul_motif.errors, :status => :unprocessable_entity }
     end
  end
  def edit
  end

  def update
    if @consul_motif.update_attributes(params[:consul_motif])
        format.html { redirect_to(@consul_motif, :notice => 'La consul_motif a eté mis a jour.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @consul_motif.errors, :status => :unprocessable_entity }
      end
  end

  def destroy
      if @consul_motif.destroy
        redirect_to(consul_motifs_url, :notice => "La consul_motif a eté eliminé.")
      end
    end
end
