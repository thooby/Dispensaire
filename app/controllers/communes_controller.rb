class CommunesController < ApplicationController
  def index
    @communes = Commune.all
  end

  def show
    @commune = Commune.find(params[:id])
  end

  def new
    @commune = Commune.new
  end

  def create
    @commune = Commune.new(params[:commune])
    if @commune.save
      redirect_to @commune, :notice => "Successfully created commune."
    else
      render :action => 'new'
    end
  end

  def edit
    @commune = Commune.find(params[:id])
  end

  def update
    @commune = Commune.find(params[:id])
    if @commune.update_attributes(params[:commune])
      redirect_to @commune, :notice  => "Successfully updated commune."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @commune = Commune.find(params[:id])
    @commune.destroy
    redirect_to communes_url, :notice => "Successfully destroyed commune."
  end
end
