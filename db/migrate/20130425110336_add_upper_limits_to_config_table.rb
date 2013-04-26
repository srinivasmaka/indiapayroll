class AddUpperLimitsToConfigTable < ActiveRecord::Migration
  def change
    add_column :config_tables, :medical_receipts_limit, :decimal
    add_column :config_tables, :limit_80c, :decimal
    add_column :config_tables, :h_loan_limit, :decimal
  end
end
