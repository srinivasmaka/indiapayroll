class UserLogin < ActiveRecord::Base
  attr_accessible :emp_id, :last_logged_date, :password, :user_name
end
