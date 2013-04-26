class FixColumnName < ActiveRecord::Migration
 def change
    rename_column :Bonus, :empid, :emp_id
  end
end