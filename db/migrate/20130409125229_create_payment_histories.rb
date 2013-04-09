class CreatePaymentHistories < ActiveRecord::Migration
  def change
    create_table :payment_histories do |t|
      t.string :emp_id
      t.string :period_id
      t.string :period_type
      t.decimal :gross_monthly
      t.decimal :basic
      t.decimal :hra
      t.decimal :conveyance
      t.decimal :medical_allowance
      t.decimal :professional_tax
      t.decimal :loss_of_hours
      t.decimal :tax_deducted
      t.decimal :net_monthly

      t.timestamps
    end
  end
end
