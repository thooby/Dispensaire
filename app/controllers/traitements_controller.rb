# -*- encoding : utf-8 -*-
class TraitementsController < ApplicationController
  load_and_authorize_resource
  
  def index
    respond_to do |format|
      format.html {
        @traitements = Traitement.order('description')
      }
      format.json { 
        @traitements =  Traitement.where("description like ?", "%#{params[:q]}%")
        render :json => @traitements.map{|d| [d.id, d.description]}
      }
    end  
  end

  def show
    @traitement = Traitement.find(params[:id])
  end

  def new
    @traitement = Traitement.new
  end

  def create
    @traitement = Traitement.new(params[:traitement])
    if @traitement.save
      redirect_to @traitement, :notice => "Successfully created traitement."
    else
      render :action => 'new'
    end
  end

  def edit
    @traitement = Traitement.find(params[:id])
  end

  def update
    @traitement = Traitement.find(params[:id])
    if @traitement.update_attributes(params[:traitement])
      redirect_to @traitement, :notice  => "Successfully updated traitement."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @traitement = Traitement.find(params[:id])
    @traitement.destroy
    redirect_to traitements_url, :notice => "Successfully destroyed traitement."
  end
end
