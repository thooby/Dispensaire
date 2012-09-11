class DiagTypesController < ApplicationController
  # GET /diag_types
  # GET /diag_types.xml
  def index
    @diag_types = DiagType.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @diag_types }
    end
  end

  # GET /diag_types/1
  # GET /diag_types/1.xml
  def show
    @diag_type = DiagType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @diag_type }
    end
  end

  # GET /diag_types/new
  # GET /diag_types/new.xml
  def new
    @diag_type = DiagType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @diag_type }
    end
  end

  # GET /diag_types/1/edit
  def edit
    @diag_type = DiagType.find(params[:id])
  end

  # POST /diag_types
  # POST /diag_types.xml
  def create
    @diag_type = DiagType.new(params[:diag_type])

    respond_to do |format|
      if @diag_type.save
        format.html { redirect_to(@diag_type, :notice => 'Diag type was successfully created.') }
        format.xml  { render :xml => @diag_type, :status => :created, :location => @diag_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @diag_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /diag_types/1
  # PUT /diag_types/1.xml
  def update
    @diag_type = DiagType.find(params[:id])

    respond_to do |format|
      if @diag_type.update_attributes(params[:diag_type])
        format.html { redirect_to(@diag_type, :notice => 'Diag type was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @diag_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /diag_types/1
  # DELETE /diag_types/1.xml
  def destroy
    @diag_type = DiagType.find(params[:id])
    @diag_type.destroy

    respond_to do |format|
      format.html { redirect_to(diag_types_url) }
      format.xml  { head :ok }
    end
  end
end
