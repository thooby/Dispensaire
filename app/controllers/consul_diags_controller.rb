# -*- encoding : utf-8 -*-
class ConsulDiagsController < ApplicationController
  def index
    @consul_diags = ConsulDiag.all
  end
  def find
   @find_diags = ConsulDiag.find_diag
  end
  def show
    @consul_diag = ConsulDiag.find(params[:id])
  end

  def new
    @consul_diag = ConsulDiag.new
  end

  def create
    @consul_diag = ConsulDiag.new(params[:consul_diag])
    if @consul_diag.save
      redirect_to @consul_diag, :notice => "Successfully created consul diag."
    else
      render :action => 'new'
    end
  end

  def edit
    @consul_diag = ConsulDiag.find(params[:id])
  end

  def update
    @consul_diag = ConsulDiag.find(params[:id])
    if @consul_diag.update_attributes(params[:consul_diag])
      redirect_to @consul_diag, :notice  => "Successfully updated consul diag."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @consul_diag = ConsulDiag.find(params[:id])
    @consul_diag.destroy
    redirect_to consul_diags_url, :notice => "Successfully destroyed consul diag."
  end
end
