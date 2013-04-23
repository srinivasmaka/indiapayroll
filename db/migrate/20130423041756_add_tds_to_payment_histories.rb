class AddTdsToPaymentHistories < ActiveRecord::Migration
  def change
    add_column :payment_histories, :tds, :decimal
  end
end
