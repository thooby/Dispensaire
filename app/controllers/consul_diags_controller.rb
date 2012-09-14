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
    datos = params[:consul_diag]
    if datos
      fecha_ini =    Date.new(datos['fecha_ini(1i)'].to_i,datos['fecha_ini(2i)'].to_i,datos['fecha_ini(3i)'].to_i)
      fecha_fin = Date.new(datos['fecha_fin(1i)'].to_i,datos['fecha_fin(2i)'].to_i,datos['fecha_fin(3i)'].to_i)
    end
    #   @registros = Registro.sel_trozo(fecha_ini,fecha_fin,datos['lugar_id'])
    if @find_diags = ConsulDiag.find_diag(fecha_ini,fecha_fin)
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
    else
      redirect_to consul_diags_find_date_url, :notice => "Pas de données dans ce intervale temporel."
    end
  end
  def find_offi
    datos = params[:consul_diag]
    year = params[:anne]
    month = params[:mois]
    if datos
      fecha_ini = Date.new(datos['fecha_ini(1i)'].to_i,datos['fecha_ini(2i)'].to_i,datos['fecha_ini(3i)'].to_i)
      fecha_fin = Date.new(datos['fecha_fin(1i)'].to_i,datos['fecha_fin(2i)'].to_i,datos['fecha_fin(3i)'].to_i)
    elsif year and month
      fecha_ini = Date.new(year.to_i,month.to_i,1)
      fecha_fin = Date.new(year.to_i,month.to_i,30)
    end

    if @find_diags3 = ConsulDiag.find_diag3(fecha_ini,fecha_fin)
      respond_to do |format|
        format.html # show.html.erb
        format.pdf do
           pdf = RapportPdf.new(@find_diags3)
           send_data pdf.render , filename:    "rapport",
                                  type:        "application/pdf",
                                  disposition: "inline"
        end
      end
    else
      respond_to do |format|
        format.html do
          redirect_to consul_diags_find_date_url, :notice => "Pas de données dans ce intervale temporel."
        end
        format.pdf do
           redirect_to consul_diags_rapp_url, :notice => "Pas de données dans ce mois."
        end
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
