class AddPlayerToShares < ActiveRecord::Migration[7.0]
  def change
    add_reference :shares, :player, null: false, foreign_key: true
  end
end
