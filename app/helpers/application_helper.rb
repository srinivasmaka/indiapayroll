module ApplicationHelper
  
  def current_period_info
    d = Date.today
    pay_details=Hash.new
    pay_details[:prev_month_start_date]  = d.prev_month().at_beginning_of_month()
    pay_details[:prev_month_end_date] = d.prev_month().at_end_of_month()
    pay_details[:pay_period] = PayPeriod.where("start_date" => @prev_month_start_date , "end_date" => @prev_month_end_date).first
    pay_details
  end
  
end
