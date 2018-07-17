# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_07_17_213103) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "conferences", force: :cascade do |t|
    t.string "name"
    t.string "key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_conferences_on_name"
  end

  create_table "players", force: :cascade do |t|
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.integer "number"
    t.string "position"
    t.integer "height"
    t.integer "weight"
    t.string "year"
    t.string "hometown"
    t.bigint "team_id"
    t.integer "espn_id"
    t.index ["espn_id"], name: "index_players_on_espn_id", unique: true
    t.index ["team_id"], name: "index_players_on_team_id"
  end

  create_table "seasons", force: :cascade do |t|
    t.integer "start_year"
    t.integer "end_year"
    t.string "description"
    t.date "start_date"
    t.date "regular_season_end_date"
    t.date "championship_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "current"
    t.index ["end_year"], name: "index_seasons_on_end_year"
    t.index ["start_year"], name: "index_seasons_on_start_year"
  end

  create_table "teams", force: :cascade do |t|
    t.string "school"
    t.string "nickname"
    t.string "abbreviation"
    t.string "home_url"
    t.string "arena"
    t.string "logo_url"
    t.bigint "conference_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "espn_id"
    t.index ["abbreviation"], name: "index_teams_on_abbreviation"
    t.index ["conference_id"], name: "index_teams_on_conference_id"
    t.index ["school"], name: "index_teams_on_school"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.boolean "admin", default: false
  end

  add_foreign_key "players", "teams"
  add_foreign_key "teams", "conferences"
end
