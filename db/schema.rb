# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_11_21_030636) do
  create_table "players", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "results", force: :cascade do |t|
    t.integer "team_id", null: false
    t.string "text"
    t.integer "points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "opponent_id"
    t.index ["team_id"], name: "index_results_on_team_id"
  end

  create_table "shares", force: :cascade do |t|
    t.integer "shares"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "player_id", null: false
    t.integer "team_id", null: false
    t.index ["player_id"], name: "index_shares_on_player_id"
    t.index ["team_id"], name: "index_shares_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "group"
  end

  add_foreign_key "results", "teams"
  add_foreign_key "shares", "players"
  add_foreign_key "shares", "teams"
end
