class ChangeDataTypes < ActiveRecord::Migration
  def change
  	 change_column :employees, :phone_number, :string
  	 change_column :employees, :bank_acc_no, :string
end
end
