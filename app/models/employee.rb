class Employee < ActiveRecord::Base
  attr_accessible :address, :bank_acc_no, :date_of_birth, :date_of_joining, :date_of_relieve, :designation, :email_id, :emp_id, :first_name, :gender, :grossCTC, :last_name, :pan_number, :phone_number, :status
end
