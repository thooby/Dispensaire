# -*- encoding : utf-8 -*-
class ConsulTratsController < ApplicationController
  def index
    @consul_trats = ConsulTrat.all
  end

  def show
    @consul_trat = ConsulTrat.find(params[:id])
  end

  def new
    @consul_trat = ConsulTrat.new
  end

  def create
    @consul_trat = ConsulTrat.new(params[:consul_trat])
    if @consul_trat.save
      redirect_to @consul_trat, :notice => "Successfully created consul trat."
    else
      render :action => 'new'
    end
  end

  def edit
    @consul_trat = ConsulTrat.find(params[:id])
  end

  def update
    @consul_trat = ConsulTrat.find(params[:id])
    if @consul_trat.update_attributes(params[:consul_trat])
      redirect_to @consul_trat, :notice  => "Successfully updated consul trat."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @consul_trat = ConsulTrat.find(params[:id])
    @consul_trat.destroy
    redirect_to consul_trats_url, :notice => "Successfully destroyed consul trat."
  end
end
