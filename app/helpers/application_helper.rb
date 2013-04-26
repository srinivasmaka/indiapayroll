module ApplicationHelper
  
  def current_period_info
    d = Date.today
    @prev_month_start_date  = d.prev_month().at_beginning_of_month()
    @prev_month_end_date = prev_month().at_end_of_month()
    
    @pay_period = PayPeriod.where("start_date" => @prev_month_start_date , "end_date" => @prev_month_end_date).first
    @period_id = @pay_period.period_id
    @current_fyear = @pay_period.current_fyear
    puts "period_id  #{@period_id} , current fyear  #{@current_fyear}"
  end
  
end
