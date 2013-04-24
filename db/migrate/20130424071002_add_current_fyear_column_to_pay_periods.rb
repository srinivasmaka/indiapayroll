class AddCurrentFyearColumnToPayPeriods < ActiveRecord::Migration
  def change
    add_column :pay_periods, :current_fyear, :string
  end
end
