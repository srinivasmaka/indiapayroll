class RemovebonusFromBonus < ActiveRecord::Migration
  def change
     remove_column :bonus, :bonus
  end

end
