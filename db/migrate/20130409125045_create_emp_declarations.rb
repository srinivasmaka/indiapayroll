class CreateEmpDeclarations < ActiveRecord::Migration
  def change
    create_table :emp_declarations do |t|
      t.string :emp_id
      t.string :hra_status
      t.decimal :total_hra
      t.decimal :medical_receipts
      t.decimal :insurance_80c
      t.decimal :ppf_80c
      t.decimal :mf_80c
      t.decimal :hloan_principal_80c
      t.decimal :nsc_80c
      t.decimal :children_fee_80c
      t.decimal :infrabonds_80c
      t.decimal :others_80c
      t.decimal :med_insurance_80d
      t.decimal :donations_80g
      t.decimal :interest_EduLoan_80e
      t.string :house_self_occupied
      t.decimal :house_rent
      t.decimal :home_loan_interest
      t.string :updated_by
      t.string :locked_for_employee
      t.string :locked_for_admin

      t.timestamps
    end
  end
end
