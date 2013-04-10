class UserloginsController < ApplicationController
  
  def new 
    
  end
  def create
    def create
  username=params[:session][:username]
  password=params[:session][:password]
  admin = UserLogin.where(:user_name=> "#{username}" , :password => "#{password}")
    if admin.any?
      session[:username] = username
      flash[:success] = "Welcome to the India Payroll App!"
      render "success"
    else
      flash.now[:error] = 'Invalid username/password combination'
      render "new"
    end
  end
  end
end
