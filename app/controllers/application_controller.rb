class ApplicationController < ActionController::Base
  protect_from_forgery
  include FullHelper
   #before_filter :authenticate
  protected 
  
  def local_request?
    false
  end

  def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:user_name, :password, :is_admin,:emp_id) }
  end
  
  def rescue_action_in_public(exception)
    case exception
    when ActiveRecord::RecordNotFound
    render :file => '#{RAILS_ROOT}/public/404.html', :status => 404
    else
    super  
    end
  end
  def after_sign_out_path_for(resource_or_scope)
        user_login_session_path
    end
  
 end
