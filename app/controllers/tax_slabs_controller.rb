class TaxSlabsController < ApplicationController
  before_filter :authenticate
  before_filter :authenticate_admin 
  
  # GET /tax_slabs
  # GET /tax_slabs.json
  def index
    @tax_slabs = TaxSlab.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @tax_slabs }
    end
  end

  # GET /tax_slabs/1
  # GET /tax_slabs/1.json
  def show
    @tax_slab = TaxSlab.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @tax_slab }
    end
  end

  # GET /tax_slabs/new
  # GET /tax_slabs/new.json
  def new
    @tax_slab = TaxSlab.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @tax_slab }
    end
  end

  # GET /tax_slabs/1/edit
  def edit
    @tax_slab = TaxSlab.find(params[:id])
  end

  # POST /tax_slabs
  # POST /tax_slabs.json
  def create
    @tax_slab = TaxSlab.new(params[:tax_slab])
    @tax_slab.year = params[:tax_slab][:id] 
    respond_to do |format|
      if @tax_slab.save
        format.html { redirect_to @tax_slab, :notice => 'Tax slab was successfully created.' }
        format.json { render :json => @tax_slab, :status => :created, :location => @tax_slab }
      else
        format.html { render :action => "new" }
        format.json { render :json => @tax_slab.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tax_slabs/1
  # PUT /tax_slabs/1.json
  def update
    @tax_slab = TaxSlab.find(params[:id])
    @tax_slab.year = params[:tax_slab][:id] 
    respond_to do |format|
      if @tax_slab.update_attributes(params[:tax_slab])
        format.html { redirect_to @tax_slab, :notice => 'Tax slab was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @tax_slab.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tax_slabs/1
  # DELETE /tax_slabs/1.json
  def destroy
    @tax_slab = TaxSlab.find(params[:id])
    @tax_slab.destroy

    respond_to do |format|
      format.html { redirect_to tax_slabs_url }
      format.json { head :no_content }
    end
  end
end
