class TaxSlab < ActiveRecord::Base
  attr_accessible :deduction_percent, :min_tax, :slab_from, :slab_to
end
