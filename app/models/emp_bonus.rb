class EmpBonus
  include ActiveModel::Conversion
   extend ActiveModel::Naming
  attr_accessor :emp_id, :period_id, :designation, :grossCTC, :ps_1, :ps_2, :ps_3, :ps_4, :others

def persisted?
  false
end
def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end
end

