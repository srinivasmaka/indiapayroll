class Addps1Tobonus < ActiveRecord::Migration
  def change
     add_column Bonus, :ps_1, :decimal
end
end
