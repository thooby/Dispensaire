class VillagesController < ApplicationController
  def index
    @villages = Village.all
  end

  def show
    @village = Village.find(params[:id])
  end

  def new
    @village = Village.new
  end

  def create
    @village = Village.new(params[:village])
    if @village.save
      redirect_to @village, :notice => "Successfully created village."
    else
      render :action => 'new'
    end
  end

  def edit
    @village = Village.find(params[:id])
  end

  def update
    @village = Village.find(params[:id])
    if @village.update_attributes(params[:village])
      redirect_to @village, :notice  => "Successfully updated village."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @village = Village.find(params[:id])
    @village.destroy
    redirect_to villages_url, :notice => "Successfully destroyed village."
  end
end
