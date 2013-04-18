class AddYearToTaxSlabs < ActiveRecord::Migration
  def change
    add_column :tax_slabs, :year, :string
  end
end
