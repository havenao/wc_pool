class AddDefaultValueToPlayerPoints < ActiveRecord::Migration[7.0]
  def change
    change_column :players, :points, :integer, default: 0
  end
end
