class Addps1Tobonus < ActiveRecord::Migration
  def change
     add_column :bonus, :ps_1, :decimal
end
end
