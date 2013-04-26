class PayslipsController < ApplicationController
  include SessionsHelper

  def show
  	@employee=Employee.find_by_emp_id(current_user.emp_id)
  	@paymentHis = PaymentHistory.where("emp_id=? and period_id='01201314'", @employee.emp_id)
  	tds = @paymentHis.first.tds ? @paymentHis.first.tds : 0
  	professional_tax = @paymentHis.first.professional_tax ? @paymentHis.first.professional_tax : 0
  	
  	gross  = @paymentHis[0].gross_monthly ? @paymentHis[0].gross_monthly : 0
  	basic  = @paymentHis[0].basic ? @paymentHis[0].basic : 0
  	hra  = @paymentHis[0].hra ? @paymentHis[0].hra : 0
  	medical_allowance  = @paymentHis[0].medical_allowance ? @paymentHis[0].me : 0

  	@total_earnings = basic + hra + medical_allowance

  	@special_allowance= 0

  	@total_deductions = tds + professional_tax
  end

  def index
  end
end
