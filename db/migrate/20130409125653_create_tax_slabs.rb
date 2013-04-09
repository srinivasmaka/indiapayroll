class CreateTaxSlabs < ActiveRecord::Migration
  def change
    create_table :tax_slabs do |t|
      t.decimal :slab_from
      t.decimal :slab_to
      t.decimal :deduction_percent
      t.decimal :min_tax

      t.timestamps
    end
  end
end
