class ChangeColTypeToBooleanInEmployeeTable < ActiveRecord::Migration
 def change 
   change_column(:employees, :status, :boolean)
 end
end
