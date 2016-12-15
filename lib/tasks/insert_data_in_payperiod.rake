namespace :pay_periods do
  task :insert_into_pay_periods => :environment do
  puts "inserting data into pay_periods"
    unless PayPeriod.exists?(:period_id => 1201617)     
    payperiod = PayPeriod.create(:period_id => 1201617, :start_date => "2016-04-01", :end_date => "2016-04-30", :period_type => "M", :current_fyear => "2016-17")
    puts "1201617 record is inserted"
    end
    puts "1201617 record is exists.......skipped"

    unless PayPeriod.exists?(:period_id => 2201617)     
    payperiod = PayPeriod.create(:period_id => 2201617, :start_date => "2016-05-01", :end_date => "2016-05-31", :period_type => "M", :current_fyear => "2016-17")
    puts "2201617 record is inserted"
    end
    puts "2201617 record is exists.......skipped"

    unless PayPeriod.exists?(:period_id => 3201617)     
    payperiod = PayPeriod.create(:period_id => 3201617, :start_date => "2016-06-01", :end_date => "2016-06-30", :period_type => "M", :current_fyear => "2016-17")
    puts "3201617 record is inserted"
    end
    puts "3201617 record is exists.......skipped"

    unless PayPeriod.exists?(:period_id => 4201617)     
    payperiod = PayPeriod.create(:period_id => 4201617, :start_date => "2016-07-01", :end_date => "2016-07-31", :period_type => "M", :current_fyear => "2016-17")
    puts "4201617 record is inserted"
    end
    puts "4201617 record is exists.......skipped"

    puts "records are inserted"
 end
end
