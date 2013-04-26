class RemovebonusFromBonus < ActiveRecord::Migration
  def up
     remove_column :Bonus, :bonus
  end

  def down
  end
end
