# -*- encoding : utf-8 -*-
class DiagnosticsController < ApplicationController
  def index
    @diagnostics = Diagnostic.all
  end

  def show
    @diagnostic = Diagnostic.find(params[:id])
  end

  def new
    @diagnostic = Diagnostic.new
  end

  def create
    @diagnostic = Diagnostic.new(params[:diagnostic])
    if @diagnostic.save
      redirect_to @diagnostic, :notice => "Successfully created diagnostic."
    else
      render :action => 'new'
    end
  end

  def edit
    @diagnostic = Diagnostic.find(params[:id])
  end

  def update
    @diagnostic = Diagnostic.find(params[:id])
    if @diagnostic.update_attributes(params[:diagnostic])
      redirect_to @diagnostic, :notice  => "Successfully updated diagnostic."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @diagnostic = Diagnostic.find(params[:id])
    @diagnostic.destroy
    redirect_to diagnostics_url, :notice => "Successfully destroyed diagnostic."
  end
end
