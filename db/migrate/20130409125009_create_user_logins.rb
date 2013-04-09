class CreateUserLogins < ActiveRecord::Migration
  def change
    create_table :user_logins do |t|
      t.string :emp_id
      t.string :user_name
      t.string :password
      t.date :last_logged_date

      t.timestamps
    end
  end
end
