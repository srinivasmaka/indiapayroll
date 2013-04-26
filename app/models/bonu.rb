class Bonu < ActiveRecord::Base
  attr_accessible :emp_id, :period_id, :period_type, :ps_1, :ps_2, :ps_3, :ps_4, :others
belongs_to :employee
end
