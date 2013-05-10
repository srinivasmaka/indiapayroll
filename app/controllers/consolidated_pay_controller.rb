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
		@gross_monthly = @gross_pay.to_f/12
		@cp= ConsolidatedPayments.new
		puts @cp.apr
		puts @cp.may

		if PaymentHistory.find(:all, @emp_id).empty?
			
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
			@ph =PaymentHistory.where("emp_id= ? and period_type=? ", @emp_id,"M"). order(:period_id)
			for i in 0..@ph.length-1 do 
				@cp.instance_variable_set(@cp.instance_variables[i], @ph[i].gross_monthly)
			end
			for i in @ph.length..11 do 
				@cp.instance_variable_set(@cp.instance_variables[i], @gross_monthly)
			end
			
		end

		if Bonu.find(:all, @emp_id).empty?
			@cp.ps1 = 0
			@cp.ps2 = 0
			@cp.ps3 = 0
			@cp.ps4 = 0

		else
			@bonusPh= Bonu.where("emp_id= ?  ", @emp_id).order(:period_id)
			
			for i in 0..@bonusPh.length-1 do 
				@cp.ps1 = @bonusPh[i].ps_1  unless @bonusPh[i].ps_1.nil?
				@cp.ps2 = @bonusPh[i].ps_2  unless @bonusPh[i].ps_2.nil?
				@cp.ps3 =@bonusPh[i].ps_3  unless @bonusPh[i].ps_3.nil?
				@cp.ps4 =@bonusPh[i].ps_4  unless @bonusPh[i].ps_4.nil?

			end
					
		end

		@cp.total= @cp.jan + @cp.feb + @cp.mar + @cp.apr + @cp.may + @cp.jun + @cp.jul + @cp.aug + @cp.sep +
					 @cp.oct + @cp.nov + @cp.dec + @cp.ps1 + @cp.ps2 + @cp.ps3 + @cp.ps4


		@paymentsHash[@emp_id]= @cp
	end

  end
end
