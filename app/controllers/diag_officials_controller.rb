class DiagOfficialsController < ApplicationController
  # GET /diag_officials
  # GET /diag_officials.xml
  def index
    @diag_officials = DiagOfficial.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @diag_officials }
    end
  end

  # GET /diag_officials/1
  # GET /diag_officials/1.xml
  def show
    @diag_official = DiagOfficial.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @diag_official }
    end
  end

  # GET /diag_officials/new
  # GET /diag_officials/new.xml
  def new
    @diag_official = DiagOfficial.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @diag_official }
    end
  end

  # GET /diag_officials/1/edit
  def edit
    @diag_official = DiagOfficial.find(params[:id])
  end

  # POST /diag_officials
  # POST /diag_officials.xml
  def create
    @diag_official = DiagOfficial.new(params[:diag_official])

    respond_to do |format|
      if @diag_official.save
        format.html { redirect_to(@diag_official, :notice => 'Diag official was successfully created.') }
        format.xml  { render :xml => @diag_official, :status => :created, :location => @diag_official }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @diag_official.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /diag_officials/1
  # PUT /diag_officials/1.xml
  def update
    @diag_official = DiagOfficial.find(params[:id])

    respond_to do |format|
      if @diag_official.update_attributes(params[:diag_official])
        format.html { redirect_to(@diag_official, :notice => 'Diag official was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @diag_official.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /diag_officials/1
  # DELETE /diag_officials/1.xml
  def destroy
    @diag_official = DiagOfficial.find(params[:id])
    @diag_official.destroy

    respond_to do |format|
      format.html { redirect_to(diag_officials_url) }
      format.xml  { head :ok }
    end
  end
end
