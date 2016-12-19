class EmpDeclarationsController < ApplicationController
  layout "employee"
  include FullHelper
  #              before_filter :authenticate
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
    @emp_declaration = EmpDeclaration.find(params[:emp_id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @emp_declaration }
    end
  end

  # GET /emp_declarations/new
  # GET /emp_declarations/new.json
  def new
    @emp_id = employee_view
    @emp_declaration = EmpDeclaration.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @emp_declaration }
    end
  end

  # GET /emp_declarations/1/edit
  def edit
    @emp_id = employee_view
    @emp_declaration = EmpDeclaration.find(params[:id])
  end

  # POST /emp_declarations
  # POST /emp_declarations.json
  def create
    @emp_id = employee_view
    @emp_declaration = EmpDeclaration.new(params[:emp_declaration])
    @emp_declaration.emp_id = @emp_id
    @emp = Employee.find_by_emp_id(@emp_id)
    respond_to do |format|
      if @emp_declaration.save
        format.html { render :action => "show" }
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
    @emp_id = employee_view
    @emp = Employee.find_by_emp_id(@emp_id)
    @emp_declaration = EmpDeclaration.new(params[:emp_declaration])
    @emp_declaration.emp_id = @emp_id
    if is_admin? == 'y'
        @emp_declaration.updated_by = "Admin"
    else
        @emp_declaration.updated_by = "Employee"
    end
    respond_to do |format|
      if @emp_declaration.save
        format.html { render :action => "show" }
        format.json { head :no_content }
      else
        format.html { render :action => "populate_declarations" }
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
  
  def current_period_info
    d = Date.today
    @prev_month_start_date  = d.prev_month().at_beginning_of_month()
    @prev_month_end_date = d.prev_month().at_end_of_month()
    
    @pay_period = PayPeriod.where("start_date" => @prev_month_start_date , "end_date" => @prev_month_end_date).first
    @period_id = @pay_period.period_id
    @current_fyear = @pay_period.current_fyear
    puts "period_id  #{@period_id} , current fyear  #{@current_fyear}"
  end
  
  
  def calculatehra 
    @emp_id =  params[:emp_id]
    @total_hra = params[:rent_receipts_total].to_i
    current_period_info
    config_info = ConfigTable.where("year" => @current_fyear).first
    basic = config_info.basic_percent
    hra = config_info.hra_percent
    employee = Employee.where("emp_id" => @emp_id).first
    @basic_sal = (employee.grossCTC.to_i*basic)/100
    @hra_cal1 =  @total_hra-(@basic_sal*0.1)
    @hra_cal2 =  (0.4*@basic_sal)
    @applicable_hra = [@hra_cal1,@hra_cal2,@total_hra].min 
    
    respond_to do |format|
     format.js 
    end
    
  end
  
  def populate_declarations
   
    @emp_id = employee_view
    @emp = Employee.find_by_emp_id(@emp_id)
    @emp_declaration = EmpDeclaration.where("emp_id" => @emp_id).order(:updated_at).reverse_order.first
    if @emp_declaration.nil?
    @emp_id = current_user_login.emp_id
    @emp_declaration = EmpDeclaration.new
    render :new
    else
    render :edit
    end    
  end
  
end
