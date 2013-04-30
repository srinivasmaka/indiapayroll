class ConfigTablesController < ApplicationController
  before_filter :authenticate
  before_filter :authenticate_admin 
  
  # GET /config_tables
  # GET /config_tables.json
  def index
    @config_tables = ConfigTable.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @config_tables }
    end
  end

  # GET /config_tables/1
  # GET /config_tables/1.json
  def show
    @config_table = ConfigTable.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @config_table }
    end
  end

  # GET /config_tables/new
  # GET /config_tables/new.json
  def new
    @config_table = ConfigTable.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @config_table }
    end
  end

  # GET /config_tables/1/edit
  def edit
    @config_table = ConfigTable.find(params[:id])
  end

  # POST /config_tables
  # POST /config_tables.json
  def create
    @config_table = ConfigTable.new(params[:config_table])
    @config_table.year = params[:config_table][:id] 
    respond_to do |format|
      if @config_table.save
        format.html { redirect_to @config_table, :notice => 'Config table was successfully created.' }
        format.json { render :json => @config_table, :status => :created, :location => @config_table }
      else
        format.html { render :action => "new" }
        format.json { render :json => @config_table.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /config_tables/1
  # PUT /config_tables/1.json
  def update
    @config_table = ConfigTable.find(params[:id])
    @config_table.year = params[:config_table][:id] 
    respond_to do |format|
      if @config_table.update_attributes(params[:config_table])
        format.html { redirect_to @config_table, :notice => 'Config table was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @config_table.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /config_tables/1
  # DELETE /config_tables/1.json
  def destroy
    @config_table = ConfigTable.find(params[:id])
    @config_table.destroy

    respond_to do |format|
      format.html { redirect_to config_tables_url }
      format.json { head :no_content }
    end
  end
end
