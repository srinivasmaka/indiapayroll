class BulkeditEmpController < ApplicationController
  
  def new
 @employees = Employee.all
 @periodID = PayPeriod.all

 # find_by_sql("select emp.first_name, emp.emp_id, emp.designation, emp.grossCTC, b.ps_1, b.ps_2, b.ps_3, b.ps_4, b.others from Employees emp inner join bonus b on emp.emp_id = b.emp_id")
 end
   
  def bulk_update
     @bulkemp_info = Hash.new
     @employees = Employee.all
     @employees.each do |employee|
     gross = params[:"#{employee.id}"]
     des =   params[:"#{employee.emp_id}"]
          
     bonus=Bonu.new     
     bonus.emp_id= employee.emp_id
     bonus.period_id = params[:emp_period_id]
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
