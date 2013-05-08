# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

u=UserLogin.find_by_user_name('admin')

unless u
  puts "    creating user : admin"
  u = UserLogin.create!( user_name: "admin", 
            password: "railsrocks", 
            is_admin: "y")
end

slabs=TaxSlab.find_by_year("2013-14")

unless slabs
  puts "Creating Slabs default values "
  TaxSlab.create!(year:"2013-14" ,
                  slab_from: 0  ,
                  slab_to: 200000 , 
                  deduction_percent: 0 , 
                  min_tax:0 )
  TaxSlab.create!(year:"2013-14" ,
                  slab_from: 200000  ,
                  slab_to: 500000 , 
                  deduction_percent: 10 ,
                   min_tax:0 )
  TaxSlab.create!(year:"2013-14" ,
                  slab_from: 500000  ,
                  slab_to: 1000000 , 
                  deduction_percent: 20 , 
                  min_tax:30000 )
  TaxSlab.create!(year:"2013-14" ,
                  slab_from: 1000000  ,
                  slab_to: 5000000 , 
                  deduction_percent: 30 , 
                  min_tax:130000 )
  
end
config=ConfigTable.find_by_year("2013-14")

unless config
  puts "creating config default values for 2013-2014 financial year"
  ConfigTable.create!(hra_percent: 30 ,
                      basic_percent: 55 ,
                      conveyance: 9600 ,
                      professional_tax:2400 ,
                      edu_cess: 3 ,
                      year:"2013-14" ,
                      medical_receipts_limit: 15000 , 
                      limit_80c: 100000 , 
                      h_loan_limit: 150000 ,
                      medical_allowance: 15000)
                      
end

pay_periods= PayPeriod.find_by_current_fyear("2013-14")
unless pay_periods 
  puts "creating pay periods default values "
  PayPeriod.create!(period_id: "1201314" ,
                      start_date: "2013-04-01" ,
                      end_date: "2013-04-30" ,
                      period_type: "M" ,
                      current_fyear: "2013-14")
  PayPeriod.create!(period_id: "2201314" ,
                      start_date: "2013-05-01" ,
                      end_date: "2013-05-31" ,
                      period_type: "M" ,
                      current_fyear: "2013-14")
  PayPeriod.create!(period_id: "3201314" ,
                      start_date: "2013-06-01" ,
                      end_date: "2013-06-30" ,
                      period_type: "M" ,
                      current_fyear: "2013-14")
  PayPeriod.create!(period_id: "4201314" ,
                      start_date: "2013-07-01" ,
                      end_date: "2013-07-31" ,
                      period_type: "M" ,
                      current_fyear: "2013-14")
end



