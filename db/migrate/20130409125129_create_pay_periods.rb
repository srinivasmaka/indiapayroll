class CreatePayPeriods < ActiveRecord::Migration
  def change
    create_table :pay_periods do |t|
      t.string :period_id
      t.date :start_date
      t.date :end_date
      t.string :period_type

      t.timestamps
    end
  end
end
