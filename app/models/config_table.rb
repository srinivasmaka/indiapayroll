class ConfigTable < ActiveRecord::Base
  attr_accessible :basic_percent, :conveyance, :edu_cess, :hra_percent, :professional_tax,:year,
  :medical_receipts_limit,:limit_80c,:h_loan_limit,:medical_allowance
  validates :basic_percent, :conveyance, :edu_cess, :hra_percent, :professional_tax,
  :year,:medical_receipts_limit,:limit_80c,:h_loan_limit,:medical_allowance, :presence=> true   
end
