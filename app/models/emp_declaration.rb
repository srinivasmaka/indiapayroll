class EmpDeclaration < ActiveRecord::Base
  attr_accessible :rent_receipts_total,:rent_receipts_cal1,:rent_receipts_cal2,:children_fee_80c, :donations_80g,
   :emp_id, :hloan_principal_80c, :home_loan_interest, :house_rent, :house_self_occupied, :hra_status, :infrabonds_80c,
    :insurance_80c, :interest_EduLoan_80e, :locked_for_admin, :locked_for_employee, :med_insurance_80d, :medical_receipts,
     :mf_80c, :nsc_80c, :others_80c, :ppf_80c, :total_hra, :updated_by, :pf_80c, :emp_contr_new_pension_scheme, 
     :contr_pension_plan, :term_deposit, :medical_expenditure_80ddb, :permanent_ph_disability_80u, 
     :pre_employment_salary, :pre_employment_tds, :other_deductions

validates :rent_receipts_total,:medical_receipts,:children_fee_80c,:donations_80g,
:hloan_principal_80c,:insurance_80c,:interest_EduLoan_80e,
:med_insurance_80d,:mf_80c,:nsc_80c,:others_80c,:ppf_80c,:home_loan_interest, :pf_80c, 
:emp_contr_new_pension_scheme, :contr_pension_plan, :term_deposit, :medical_expenditure_80ddb,
:permanent_ph_disability_80u, :numericality => true 

end
