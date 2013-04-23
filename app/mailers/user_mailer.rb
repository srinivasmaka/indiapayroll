class UserMailer < ActionMailer::Base
  default :from => "icentrispayroll@gmail.com"
  
   def emp_registration(employee,user)
    @emp_name = employee.first_name
     @emp_ID= employee.emp_id
     @emp_pass = user.password
        @url  = "http://localhost:3000/sessions/new"
       mail(:to => employee.email_id, :subject => "Sign In")
    end
end