class ConfigTablesController < ApplicationController
  # before_filter :authenticate
  # before_filter :authenticate_admin 
  
  # GET /config_tables
  # GET /config_tables.json
  def index
    @config_tables = ConfigTable.all
    respond_to do |format|
      format.html # index.html.erb
      format.js
    end
  end

  # GET /config_tables/1
  # GET /config_tables/1.json
  def show
    @config_table = ConfigTable.find(params[:id])
    respond_to do |format|
      format.js
      format.html # show.html.erb
    end
  end

  # GET /config_tables/new
  # GET /config_tables/new.json
  def new
    @config_table = ConfigTable.new
    respond_to do |format|
      format.js
      format.html # new.html.erb
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
        format.html { redirect_to config_tables_path, :notice => 'Config table was successfully created.' }
      else
        format.html { render :action => "new" }
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
        format.html { redirect_to config_tables_path, :notice => 'Config table was successfully updated.' }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /config_tables/1
  # DELETE /config_tables/1.json
  def destroy
    @config_table = ConfigTable.find(params[:id])
    @config_table.destroy
    respond_to do |format|
      @config_tables = ConfigTable.all
      format.js
    end
  end
end
