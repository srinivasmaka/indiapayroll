class UserLogin < ActiveRecord::Base
  attr_accessible :emp_id, :last_logged_date, :password, :user_name , :is_admin
  
  
  
  class << self
    def authenticate(username, password)
      user = find_by_user_name(username)
      (user && user.password== password) ? user : nil
    end
    
    def authenticate_with_salt(id, cookie_salt)
      user = find_by_id(id)
      (user && user.salt == cookie_salt) ? user : nil
    end
  end
end
