class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :emp_id
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.string :email_id
      t.text :address
      t.integer :phone_number
      t.integer :pan_number
      t.integer :bank_acc_no
      t.string :designation
      t.string :grossCTC
      t.date :date_of_joining
      t.date :date_of_birth
      t.date :date_of_relieve
      t.string :status

      t.timestamps
    end
  end
end
