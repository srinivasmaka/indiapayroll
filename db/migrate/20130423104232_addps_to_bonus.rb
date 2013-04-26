class AddpsToBonus < ActiveRecord::Migration
  def change
     add_column Bonus, :ps_2, :decimal
     add_column Bonus, :ps_3, :decimal
     add_column Bonus, :ps_4, :decimal
     add_column Bonus, :others, :decimal
 end    
  end
