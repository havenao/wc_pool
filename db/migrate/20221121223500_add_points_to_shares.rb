class AddPointsToShares < ActiveRecord::Migration[7.0]
  def change
    add_column :shares, :points, :integer
  end
end
