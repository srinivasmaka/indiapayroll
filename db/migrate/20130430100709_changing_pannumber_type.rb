class ChangingPannumberType < ActiveRecord::Migration
  def change 
    change_column :employees, :pan_number, :string
  end
end
