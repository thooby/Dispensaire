# -*- encoding : utf-8 -*-
class SexesController < ApplicationController
  def index
    @sexes = Sex.all
  end

  def show
    @sex = Sex.find(params[:id])
  end

  def new
    @sex = Sex.new
  end

  def create
    @sex = Sex.new(params[:sex])
    if @sex.save
      redirect_to @sex, :notice => "Successfully created sex."
    else
      render :action => 'new'
    end
  end

  def edit
    @sex = Sex.find(params[:id])
  end

  def update
    @sex = Sex.find(params[:id])
    if @sex.update_attributes(params[:sex])
      redirect_to @sex, :notice  => "Successfully updated sex."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @sex = Sex.find(params[:id])
    @sex.destroy
    redirect_to sexes_url, :notice => "Successfully destroyed sex."
  end
end
