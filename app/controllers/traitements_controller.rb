class TraitementsController < ApplicationController
  def index
    @traitements = Traitement.all
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
