class ChangeColTypeToBooleanInUserslogins < ActiveRecord::Migration
  def change 
    change_column(:user_logins, :is_admin, :boolean)
  end
end
