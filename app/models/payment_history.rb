class PaymentHistory < ActiveRecord::Base
  attr_accessible :basic, :conveyance, :emp_id, :gross_monthly, :hra, :loss_of_hours, :medical_allowance, :net_monthly, :period_id, :period_type, :professional_tax, :tax_deducted
end
