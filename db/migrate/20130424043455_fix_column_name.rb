class FixColumnName < ActiveRecord::Migration
 def change
    rename_column :bonus, :empid, :emp_id
  end
end