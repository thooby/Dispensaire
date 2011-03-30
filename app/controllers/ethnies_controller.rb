class EthniesController < ApplicationController
  def index
    @ethnies = Ethnie.all
  end

  def show
    @ethnie = Ethnie.find(params[:id])
  end

  def new
    @ethnie = Ethnie.new
  end

  def create
    @ethnie = Ethnie.new(params[:ethnie])
    if @ethnie.save
      redirect_to @ethnie, :notice => "Successfully created ethnie."
    else
      render :action => 'new'
    end
  end

  def edit
    @ethnie = Ethnie.find(params[:id])
  end

  def update
    @ethnie = Ethnie.find(params[:id])
    if @ethnie.update_attributes(params[:ethnie])
      redirect_to @ethnie, :notice  => "Successfully updated ethnie."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @ethnie = Ethnie.find(params[:id])
    @ethnie.destroy
    redirect_to ethnies_url, :notice => "Successfully destroyed ethnie."
  end
end
