class CreateResults < ActiveRecord::Migration[7.0]
  def change
    create_table :results do |t|
      t.references :team, null: false, foreign_key: true
      t.string :text
      t.integer :points

      t.timestamps
    end
  end
end
