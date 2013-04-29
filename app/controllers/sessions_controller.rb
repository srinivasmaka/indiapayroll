class SessionsController < ApplicationController
  
  include SessionsHelper 
  include ApplicationHelper
  protect_from_forgery
  

  def new
  end

  def create
    user = UserLogin.authenticate(params[:session][:username],params[:session][:password])
    if user.nil? 
      flash.now[:error] = "Invalid username/password combination."
      render 'new'
      elsif  user.is_admin=='y'
      sign_in(user)
      render "success"
    else
      sign_in(user)  
      flash[:success] ="Hi #{user.user_name} welcome to India Payroll app"
      redirect_to empinfo_path
    end
  end
 

  def destroy
    sign_out
    redirect_to new_session_path
    flash[:success] ="succefully logout the PayRoll Application"
  end
  
   end
  
  

