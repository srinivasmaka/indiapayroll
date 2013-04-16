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
      @title = "Sign in"
      render 'new'
    else
      sign_in user
      render "success"
    end
  end
 

  def destroy
    sign_out
    redirect_to new_session_path
    flash[:success] ="succefully logout the PayRoll Application"
  end
  
   end
  
  

