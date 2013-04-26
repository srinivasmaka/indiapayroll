class AddSpecialAllowance < ActiveRecord::Migration
    def change
    add_column :payment_histories, :special_allowance, :decimal
    add_column :payment_histories, :full_name, :string
  end
end
