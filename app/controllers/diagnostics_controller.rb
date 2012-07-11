# -*- encoding : utf-8 -*-
class DiagnosticsController < ApplicationController
  load_and_authorize_resource
  
  def index
    respond_to do |format|
      format.html {
        @diagnostics = Diagnostic.all
      }
      format.json { 
        @diagnostics =  Diagnostic.where("description like ?", "%#{params[:q]}%")
        render :json => @diagnostics.map{|d| [d.id, d.description]} }
    end
  end

  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @diagnostic }
    end    
  end

  def new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @diagnostic }
    end 
  end

  def create
    @diagnostic = Diagnostic.new(params[:diagnostic])
    if @diagnostic.save
      redirect_to @diagnostic, :notice => "Le diagnostic a été creé."
    else
      render :action => 'new'
    end
    if @diagnostic.save
         format.html { redirect_to(@diagnostic, :notice => 'Le diagnostic a eté  creé.') }
         format.xml  { render :xml => @diagnostic, :status => :created, :location => @diagnostic }
       else
         format.html { render :action => "new" }
         format.xml  { render :xml => @diagnostic.errors, :status => :unprocessable_entity }
       end
  end

  def edit
  end

  def update
    if @diagnostic.update_attributes(params[:diagnostic])
      redirect_to @diagnostic, :notice  => "Successfully updated diagnostic."
    else
      render :action => 'edit'
    end
  end

  def destroy
    if @diagnostic.destroy
      redirect_to diagnostics_url, :notice => "Le diagnostic a eté eliminé"
    end
  end
end
