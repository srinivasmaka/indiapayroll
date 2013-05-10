class BulkeditEmpController < ApplicationController
  include ApplicationHelper
  def new
     @periodID =  PayPeriod.all
     @employees = Employee.find_by_sql("select emp_id,first_name,grossCTC,designation,(select  ps_1 from bonus where emp_id=emp.emp_id order by id desc limit 1) as PS_1,(select  ps_2 from bonus where emp_id=emp.emp_id order by id desc limit 1)  as PS_2, (select ps_3 from bonus where emp_id=emp.emp_id order by id desc limit 1)  as PS_3,
                  (select ps_4 from bonus where emp_id=emp.emp_id order by id desc limit 1)  as PS_4,(select others from bonus where emp_id=emp.emp_id order by id desc limit 1)  as others  from employees emp")
  end
   
  def bulk_update
     @bulkemp_info = Hash.new
     @employees = Employee.all
     @employees.each do |employee|
     gross = params[:"#{employee.emp_id}_gross"]
     des =   params[:"#{employee.emp_id}"]
          
     bonus=Bonu.new     
     bonus.emp_id= employee.emp_id
     bonus.period_id = current_period_info[:period_id]
     bonus.ps_1 =   params[:"#{employee.emp_id}_b1"]
     bonus.ps_2 =   params[:"#{employee.emp_id}_b2"]
     bonus.ps_3 =   params[:"#{employee.emp_id}_b3"]
     bonus.ps_4 =   params[:"#{employee.emp_id}_b4"]
     bonus.others = params[:"#{employee.emp_id}_b5"]
     @emp =  Employee.find_by_id(employee.id)
     @emp.update_attributes(:grossCTC => gross, :designation => des)
     bonus.save 
     @emp_bonus = EmpBonus.new
     @emp_bonus.emp_id    = bonus.emp_id
     @emp_bonus.period_id = bonus.period_id 
     @emp_bonus.ps_1      = bonus.ps_1
     @emp_bonus.ps_2      = bonus.ps_2
     @emp_bonus.ps_3      = bonus.ps_3
     @emp_bonus.ps_4      = bonus.ps_4 
     @emp_bonus.others    = bonus.others 
     @emp_bonus.grossCTC  = gross
     @emp_bonus.designation  = des
     @bulkemp_info[employee.emp_id]= @emp_bonus
      end
  end
end
