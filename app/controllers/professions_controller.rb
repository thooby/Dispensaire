class ProfessionsController < ApplicationController
  def index
    @professions = Profession.all
  end

  def show
    @profession = Profession.find(params[:id])
  end

  def new
    @profession = Profession.new
  end

  def create
    @profession = Profession.new(params[:profession])
    if @profession.save
      redirect_to @profession, :notice => "Successfully created profession."
    else
      render :action => 'new'
    end
  end

  def edit
    @profession = Profession.find(params[:id])
  end

  def update
    @profession = Profession.find(params[:id])
    if @profession.update_attributes(params[:profession])
      redirect_to @profession, :notice  => "Successfully updated profession."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @profession = Profession.find(params[:id])
    @profession.destroy
    redirect_to professions_url, :notice => "Successfully destroyed profession."
  end
end
