class AddHraDetailsToEmpDeclarations < ActiveRecord::Migration
  def change
    add_column :emp_declarations, :rent_receipts_total, :decimal
    add_column :emp_declarations, :rent_receipts_cal1, :decimal
    add_column :emp_declarations, :rent_receipts_cal2, :decimal
  end
end
