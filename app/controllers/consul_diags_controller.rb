# -*- encoding : utf-8 -*-
class ConsulDiagsController < ApplicationController
  load_and_authorize_resource
  
  def index
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @consul_diags }
    end
 
  end

  def find
    @find_diags = ConsulDiag.find_diag
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @consul_diag }
      format.pdf do
           pdf = RapportPdf.new(@find_diags)
           send_data pdf.render , filename:    "rapport",
                                  type:        "application/pdf",
                                  disposition: "inline"
      end
    end
  end
  
  def find_offi
    @find_diags3 = ConsulDiag.find_diag3
    respond_to do |format|
      format.html # show.html.erb
      format.pdf do
           pdf = RapportPdf.new(@find_diags3)
           send_data pdf.render , filename:    "rapport",
                                  type:        "application/pdf",
                                  disposition: "inline"
      end
    end
  end

  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @consul_diag }
    end
 
  end

  def new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @consul_diag }
    end
 
  end

  def create
    if @consul_diag.save
       format.html { redirect_to(@consul_diag, :notice => 'La consul_diag a eté  creé.') }
       format.xml  { render :xml => @consul_diag, :status => :created, :location => @consul_diag }
     else
       format.html { render :action => "new" }
       format.xml  { render :xml => @consul_diag.errors, :status => :unprocessable_entity }
     end
  end
  def edit
  end

  def update
    if @consul_diag.update_attributes(params[:consul_diag])
        format.html { redirect_to(@consul_diag, :notice => 'La consul_diag a eté mis a jour.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @consul_diag.errors, :status => :unprocessable_entity }
      end
  end

  def destroy
      if @consul_diag.destroy
        redirect_to(consul_diags_url, :notice => "La consul_diag a eté eliminé.")
      end
    end
end
