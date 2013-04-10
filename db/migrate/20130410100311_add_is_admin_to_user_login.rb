class AddIsAdminToUserLogin < ActiveRecord::Migration
  def change
    add_column :user_logins, :is_admin, :string
  end
end
