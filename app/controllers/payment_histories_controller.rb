class PaymentHistoriesController < ApplicationController
  # GET /payment_histories
  # GET /payment_histories.json
  def index
    @payment_histories = PaymentHistory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @payment_histories }
    end
  end

  # GET /payment_histories/1
  # GET /payment_histories/1.json
  def show
    @payment_history = PaymentHistory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @payment_history }
    end
  end

  # GET /payment_histories/new
  # GET /payment_histories/new.json
  def new
    @payment_history = PaymentHistory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @payment_history }
    end
  end

  # GET /payment_histories/1/edit
  def edit
    @payment_history = PaymentHistory.find(params[:id])
  end

  # POST /payment_histories
  # POST /payment_histories.json
  def create
    @payment_history = PaymentHistory.new(params[:payment_history])

    respond_to do |format|
      if @payment_history.save
        format.html { redirect_to @payment_history, :notice => 'Payment history was successfully created.' }
        format.json { render :json => @payment_history, :status => :created, :location => @payment_history }
      else
        format.html { render :action => "new" }
        format.json { render :json => @payment_history.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /payment_histories/1
  # PUT /payment_histories/1.json
  def update
    @payment_history = PaymentHistory.find(params[:id])

    respond_to do |format|
      if @payment_history.update_attributes(params[:payment_history])
        format.html { redirect_to @payment_history, :notice => 'Payment history was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @payment_history.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /payment_histories/1
  # DELETE /payment_histories/1.json
  def destroy
    @payment_history = PaymentHistory.find(params[:id])
    @payment_history.destroy

    respond_to do |format|
      format.html { redirect_to payment_histories_url }
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
  
  def load_payment
    @salary_info=Hash.new
    @payload_hash = Hash.new
    current_period_info
    employees =Employee.all
    unless employees.empty?
    employees.each do |employee|
    @salary_info[employee.emp_id]= params[:monthlysal][:"#{employee.emp_id}"]
    end
    end
    @config_info = ConfigTable.where("year" => @current_fyear).first
    @salary_info.each do |key, value|
    emp_id = key
    net_pay = value
    @tds = calculate_tds(emp_id,net_pay)
    @hra_percent = @config_info.hra_percent
    @basic_percent = @config_info.basic_percent
    @p_tax = @config_info.professional_tax
    @conveyance = @config_info.conveyance
    @hra_percent = @config_info.hra_percent
    @edu_cess = @config_info.edu_cess
    
    @payment_history = PaymentHistory.new(params[:payment_history])
    @payment_history.emp_id = emp_id
    employee =Employee.find_by_emp_id(emp_id)
    @payment_history.full_name=employee.first_name + employee.last_name
    @payment_history.hra = (@hra_percent * net_pay.to_i)/100 
    @payment_history.basic = (@basic_percent * net_pay.to_i)/100
    @payment_history.tds = @tds
    @payment_history.period_id = @period_id
    @payment_history.conveyance = @conveyance
    @payment_history.professional_tax = @p_tax
    @payment_history.loss_of_hours = @loss_of_hours
    taxble_income = net_pay.to_i - (@tds.to_i + @p_tax)
    
    @calculated_tax = calculate_tax(taxble_income)
    @calculated_tax = @calculated_tax 
    @payment_history.tax_deducted = @calculated_tax
    @payment_history.save
    @payload_hash[emp_id]= @payment_history
    end
 
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @payment_histories }
      end
      @payload_hash
  end  

  def calculate_tax(net)
   @s =  TaxSlab.where("year" => @current_fyear)
   @t = net
     @s.each do |slab|
        if t.to_i >= slab.slab_from.to_i &&  t.to_i < slab.slab_to.to_i
        percentage = slab.deduction_percent
        min_amount = slab.min_tax
        extra_amount = t.to_i - slab.slab_from.to_i
        @tax_slab = ((extra_amount/100)*percentage.to_i)+min_amount.to_i 
        end
     end
    @t_s = @tax_slab
  end
      
  def calculate_tds(emp_id , net_pay)
    @emp_id =  emp_id
    @net_pay = net_pay
    @emp_declaration = EmpDeclaration.where("emp_id" => @emp_id).order(:updated_at).reverse_order.first
    section1 = @emp_declaration.total_hra
    section2 = [@emp_declaration.medical_receipts,@config_info.medical_receipts_limit].min
    @config_info = ConfigTable.where("year" => @current_fyear).first
    section3 = @config_info.conveyance
    sum_section4 = 0
    section4_components = [@emp_declaration.insurance_80c,@emp_declaration.ppf_80c,
    @emp_declaration.mf_80c,@emp_declaration.hloan_principal_80c,
    @emp_declaration.children_fee_80c,@emp_declaration.nsc_80c,
    @emp_declaration.infrabonds_80c,@emp_declaration.others_80c]
    sum_section4 = section4_components.inject{|sum_section4,x| sum_section4 + x }
    section4 = [sum_section4,@config_info.limit_80c].min  
    section5 = [ @emp_declaration.donations_80g,@emp_declaration.med_insurance_80d,@emp_declaration.interest_EduLoan_80e].sum
    @house_self_occupied_flag = @emp_declaration.house_self_occupied
    if @house_self_occupied_flag.nil?
      @interst_on_hloan = @emp_declaration.home_loan_interest
     else
      @total_ctc = @net_pay + @emp_declaration.house_rent
      @interst_on_hloan = [@emp_declaration.home_loan_interest,@config_info.h_loan_limit].min
    end
  section6 = @interst_on_hloan
  @tds = [section1,section2,section3,section4,section5,section6].sum
  
  end
  
  
  def monthly_salaries
    @employees = Employee.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json=> @employees }
  end
  end
  
end
