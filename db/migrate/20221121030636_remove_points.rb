class RemovePoints < ActiveRecord::Migration[7.0]
  def change
    remove_column :players, :points 
    remove_column :teams, :points 
  end
end
