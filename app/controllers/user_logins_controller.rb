class UserLoginsController < ApplicationController
   
   def index

   end
  def new 
    @user = UserLogin.new
    render create
  end

  def show
    user = UserLogin.find(current_user_login.id)
    
   if user.nil? 
     flash.now[:error] = "Invalid username/password combination."
     render 'new'
   elsif  user.is_admin == "y"
   
     adminlogin
   else
    employeelogin
  end
end
  def adminlogin
    #render "success"
    render 'index'
  end

  def employeelogin
    flash[:success] ="Hi #{current_user_login.user_name} welcome to India Payroll app"
     redirect_to profile_employee_path(:emp_id)
     #render 'employeeinfo'
  end

end