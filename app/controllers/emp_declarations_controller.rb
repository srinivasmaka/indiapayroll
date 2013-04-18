class EmpDeclarationsController < ApplicationController
  layout "employee"
  include SessionsHelper
  before_filter :authenticate
  # GET /emp_declarations
  # GET /emp_declarations.json
  def index
    @emp_declarations = EmpDeclaration.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @emp_declarations }
    end
  end

  # GET /emp_declarations/1
  # GET /emp_declarations/1.json
  def show
    @emp_declaration = EmpDeclaration.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @emp_declaration }
    end
  end

  # GET /emp_declarations/new
  # GET /emp_declarations/new.json
  def new
    @emp_id = current_user.emp_id
    @emp_declaration = EmpDeclaration.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @emp_declaration }
    end
  end

  # GET /emp_declarations/1/edit
  def edit
    @emp_id = current_user.emp_id
    @emp_declaration = EmpDeclaration.find(params[:id])
  end

  # POST /emp_declarations
  # POST /emp_declarations.json
  def create
    @emp_declaration = EmpDeclaration.new(params[:emp_declaration])

    respond_to do |format|
      if @emp_declaration.save
        format.html { redirect_to @emp_declaration, :notice => 'Emp declaration was successfully created.' }
        format.json { render :json => @emp_declaration, :status => :created, :location => @emp_declaration }
      else
        format.html { render :action => "new" }
        format.json { render :json => @emp_declaration.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /emp_declarations/1
  # PUT /emp_declarations/1.json
  def update
    @emp_declaration = EmpDeclaration.find(params[:id])

    respond_to do |format|
      if @emp_declaration.update_attributes(params[:emp_declaration])
        format.html { redirect_to @emp_declaration, :notice => 'Emp declaration was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @emp_declaration.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /emp_declarations/1
  # DELETE /emp_declarations/1.json
  def destroy
    @emp_declaration = EmpDeclaration.find(params[:id])
    @emp_declaration.destroy

    respond_to do |format|
      format.html { redirect_to emp_declarations_url }
      format.json { head :no_content }
    end
  end
  
  def calculatehra 
    @emp_id =  params[:emp_id]
    @total_hra = params[:rent_receipts_total].to_i
    @employee = Employee.where("emp_id" => @emp_id).first
    @hra_cal1 =  @total_hra-(@employee.grossCTC.to_i*0.1)
    @hra_cal2 =  (0.4*@employee.grossCTC.to_i)
    @applicable_hra = [@hra_cal1,@hra_cal2,@total_hra].min 
    respond_to do |format|
    format.js
    end
  end
  
  
end
