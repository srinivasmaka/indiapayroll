class PayslipsController < ApplicationController
  layout "employee"  

  def show
    
    @payperiod = PayPeriod.find_by_period_id(params[:id])
   
  	@employee=Employee.find_by_emp_id(employee_view)
  	@paymentHis = PaymentHistory.where("emp_id=? and period_id=?", @employee.emp_id, @payperiod.period_id).first
  	
    tds                = @paymentHis.tds ? @paymentHis.tds : 0
  	professional_tax   = @paymentHis.professional_tax ? @paymentHis.professional_tax : 0
  	gross              = @paymentHis.gross_monthly ? @paymentHis.gross_monthly : 0
  	basic              = @paymentHis.basic ? @paymentHis.basic : 0
  	hra                = @paymentHis.hra ? @paymentHis.hra : 0
  	medical_allowance  = @paymentHis.medical_allowance ? @paymentHis.medical_allowance : 0

  	@total_earnings    = basic + hra + medical_allowance

  	@total_deductions  = tds + professional_tax

  end

  def index
    @paymentRecords = PaymentHistory.where("emp_id=?", employee_view)
  end
end
