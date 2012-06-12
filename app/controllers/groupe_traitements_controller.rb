class GroupeTraitementsController < ApplicationController
  def index
    @groupe_traitements = GroupeTraitement.all
  end

  def show
    @groupe_traitement = GroupeTraitement.find(params[:id])
  end

  def new
    @groupe_traitement = GroupeTraitement.new
  end

  def create
    @groupe_traitement = GroupeTraitement.new(params[:groupe_traitement])
    if @groupe_traitement.save
      redirect_to @groupe_traitement, :notice => "Successfully created groupe traitement."
    else
      render :action => 'new'
    end
  end

  def edit
    @groupe_traitement = GroupeTraitement.find(params[:id])
  end

  def update
    @groupe_traitement = GroupeTraitement.find(params[:id])
    if @groupe_traitement.update_attributes(params[:groupe_traitement])
      redirect_to @groupe_traitement, :notice  => "Successfully updated groupe traitement."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @groupe_traitement = GroupeTraitement.find(params[:id])
    @groupe_traitement.destroy
    redirect_to groupe_traitements_url, :notice => "Successfully destroyed groupe traitement."
  end
end
