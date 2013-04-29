class AddpsToBonus < ActiveRecord::Migration
  def change
     add_column :bonus, :ps_2, :decimal
     add_column :bonus, :ps_3, :decimal
     add_column :bonus, :ps_4, :decimal
     add_column :bonus, :others, :decimal
 end    
  end
