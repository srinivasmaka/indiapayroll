class ConfigTable < ActiveRecord::Base
  attr_accessible :basic_percent, :conveyance, :edu_cess, :hra_percent, :professional_tax,:year
  validates :basic_percent, :conveyance, :edu_cess, :hra_percent, :professional_tax,:year,:presence=> true   
end
