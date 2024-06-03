class AddCreditsToPlayer < ActiveRecord::Migration[7.0]
  def change
    add_column :players, :credits, :integer, default: 100
  end
end
