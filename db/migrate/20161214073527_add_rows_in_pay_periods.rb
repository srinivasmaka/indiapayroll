class AddRowsInPayPeriods < ActiveRecord::Migration
  def change
  	PayPeriod.create([{:period_id => "1201617", :start_date => "2016-04-01", :end_date => "2016-04-30", :period_type => "M", :current_fyear => "2016-2017"},
  	                 {:period_id => "2201617", :start_date => "2016-05-01", :end_date => "2016-05-30", :period_type => "M", :current_fyear => "2016-2017"},
  	                 {:period_id => "3201617", :start_date => "2016-06-01", :end_date => "2016-06-30", :period_type => "M", :current_fyear => "2016-2017"},
  	                 {:period_id => "4201617", :start_date => "2016-07-01", :end_date => "2016-07-30", :period_type => "M", :current_fyear => "2016-2017"} ])
  end
end
