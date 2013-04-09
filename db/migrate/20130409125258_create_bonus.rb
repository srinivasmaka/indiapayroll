class CreateBonus < ActiveRecord::Migration
  def change
    create_table :bonus do |t|
      t.string :empid
      t.decimal :bonus
      t.string :period_id
      t.string :period_type

      t.timestamps
    end
  end
end
