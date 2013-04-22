class ConsolidatedPayController < ApplicationController
  def index
  	@employees = Employee.all
  	@month_names=  Date::ABBR_MONTHNAMES.dup
	@month_names.shift
	@month_names.rotate!(3)
	@paymentsHash = Hash.new


	for e in @employees do 
		@emp_id= e.emp_id
		@gross_pay= e.grossCTC
		@cp= ConsolidatedPayments.new

		if PaymentHistory.find(:all, @emp_id).empty?
			@gross_monthly = @gross_pay.to_f/12
			@cp.jan =@gross_monthly
			@cp.feb= @gross_monthly
			@cp.mar = @gross_monthly
			@cp.apr =@gross_monthly
			@cp.may= @gross_monthly
			@cp.jun = @gross_monthly
			@cp.jul =@gross_monthly
			@cp.aug= @gross_monthly
			@cp.sep = @gross_monthly
			@cp.oct =@gross_monthly
			@cp.nov= @gross_monthly
			@cp.dec = @gross_monthly
							
		else
			@ph =PaymentHistory.where(":emp_id= ? and payment_type!=? ", @emp_id,"Q"). order(:period_id)
			@cp.apr=@ph[1]
			
		end

		if Bonus.find(:all, @emp_id).empty?
			@cp.ps1 =0
			@cp.ps2= 0
			@cp.ps3 = 0
			@cp.ps4 = 0

		else
			@bonusPh= PaymentHistory.where(":emp_id= ? and payment_type=? ", @emp_id, "Q")
			@cp.ps1="0"
			@cp.ps2="0"
			@cp.ps3="0"
			@cp.ps4="0"
		end
		 
		@cp.total= @cp.jan + @cp.feb + @cp.mar + @cp.apr + @cp.may + @cp.jun + @cp.jul + @cp.aug + @cp.sep +
					 @cp.oct + @cp.nov + @cp.dec 



		@paymentsHash[@emp_id]= @cp
	end

  end
end
