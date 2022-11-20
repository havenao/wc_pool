class AddOpponentToResult < ActiveRecord::Migration[7.0]
  def change
    add_column :results, :opponent_id, :integer
  end
end
