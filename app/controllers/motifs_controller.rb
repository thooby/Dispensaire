class MotifsController < ApplicationController
  def index
     respond_to do |format|
        format.html {
          @motifs = Motif.all
        }
        format.json { 
          @motifs =  Motif.where("description like ?", "%#{params[:q]}%")
          render :json => @motifs.map{|d| [d.id, d.description]} }
      end
    
  end

  def show
    @motif = Motif.find(params[:id])
  end

  def new
    @motif = Motif.new
  end

  def create
    @motif = Motif.new(params[:motif])
    if @motif.save
      redirect_to @motif, :notice => "Successfully created motif."
    else
      render :action => 'new'
    end
  end

  def edit
    @motif = Motif.find(params[:id])
  end

  def update
    @motif = Motif.find(params[:id])
    if @motif.update_attributes(params[:motif])
      redirect_to @motif, :notice  => "Successfully updated motif."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @motif = Motif.find(params[:id])
    @motif.destroy
    redirect_to motifs_url, :notice => "Successfully destroyed motif."
  end
end
