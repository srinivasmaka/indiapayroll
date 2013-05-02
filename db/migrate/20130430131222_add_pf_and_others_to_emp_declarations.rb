class AddPfAndOthersToEmpDeclarations < ActiveRecord::Migration
  def change
  	add_column :emp_declarations, :pf_80c, :decimal
    add_column :emp_declarations, :emp_contr_new_pension_scheme, :decimal
    add_column :emp_declarations, :contr_pension_plan, :decimal
    add_column :emp_declarations, :term_deposit, :decimal
    add_column :emp_declarations, :medical_expenditure_80ddb, :decimal
    add_column :emp_declarations, :permanent_ph_disability_80u, :decimal
    add_column :emp_declarations, :pre_employment_salary, :decimal
    add_column :emp_declarations, :pre_employment_tds, :decimal
    add_column :emp_declarations, :other_deductions, :decimal
  end
end
