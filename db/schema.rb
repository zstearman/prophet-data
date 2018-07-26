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

ActiveRecord::Schema.define(version: 2018_07_26_155328) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "conferences", force: :cascade do |t|
    t.string "name"
    t.string "key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_conferences_on_name"
  end

  create_table "games", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "season_id"
    t.integer "season_type"
    t.string "status"
    t.string "away_team_name"
    t.string "home_team_name"
    t.integer "away_score"
    t.integer "home_score"
    t.datetime "updated"
    t.string "period"
    t.decimal "point_spread"
    t.decimal "over_under"
    t.integer "home_money_line"
    t.integer "away_money_line"
    t.integer "tournament_id"
    t.string "bracket"
    t.integer "round"
    t.integer "away_seed"
    t.integer "home_seed"
    t.integer "espn_id"
    t.integer "away_previous_espn_id"
    t.integer "home_previous_espn_id"
    t.integer "tournament_display_order"
    t.date "date"
    t.integer "home_team_id"
    t.integer "away_team_id"
    t.integer "home_team_season_id"
    t.integer "away_team_season_id"
    t.boolean "neutral"
    t.index ["espn_id"], name: "index_games_on_espn_id"
    t.index ["season_id"], name: "index_games_on_season_id"
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

  create_table "team_seasons", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "team_id"
    t.bigint "season_id"
    t.bigint "conference_id"
    t.string "type"
    t.integer "games_played"
    t.integer "minutes"
    t.integer "wins"
    t.integer "losses"
    t.integer "conf_games_played"
    t.integer "conf_wins"
    t.integer "conf_losses"
    t.decimal "win_pct"
    t.decimal "conf_win_pct"
    t.integer "points"
    t.decimal "points_per_game"
    t.integer "fgm"
    t.decimal "fgm_per_game"
    t.integer "fga"
    t.decimal "fga_per_game"
    t.decimal "fg_pct"
    t.integer "three_points_made"
    t.decimal "tpm_per_game"
    t.integer "three_points_attempted"
    t.decimal "tpa_per_game"
    t.decimal "three_points_pct"
    t.integer "ftm"
    t.decimal "ftm_per_game"
    t.integer "fta"
    t.decimal "fta_per_game"
    t.decimal "ft_pct"
    t.integer "oreb"
    t.decimal "oreb_per_game"
    t.integer "dreb"
    t.decimal "dreb_per_game"
    t.integer "rebounds"
    t.decimal "rebounds_per_game"
    t.integer "assists"
    t.decimal "assistes_per_game"
    t.integer "tov"
    t.decimal "tov_per_game"
    t.integer "steals"
    t.decimal "steals_per_game"
    t.integer "blocks"
    t.decimal "blocks_per_game"
    t.integer "blka"
    t.decimal "blka_per_game"
    t.integer "fouls"
    t.decimal "fouls_per_game"
    t.integer "fouls_drawn"
    t.decimal "fouls_drawn_per_game"
    t.integer "point_diff"
    t.decimal "point_diff_per_game"
    t.integer "two_points_made"
    t.integer "two_points_attempted"
    t.decimal "two_points_pct"
    t.index ["conference_id"], name: "index_team_seasons_on_conference_id"
    t.index ["season_id"], name: "index_team_seasons_on_season_id"
    t.index ["team_id"], name: "index_team_seasons_on_team_id"
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
    t.index ["espn_id"], name: "index_teams_on_espn_id"
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

  add_foreign_key "games", "seasons"
  add_foreign_key "games", "team_seasons", column: "away_team_season_id"
  add_foreign_key "games", "team_seasons", column: "home_team_season_id"
  add_foreign_key "games", "teams", column: "away_team_id"
  add_foreign_key "games", "teams", column: "home_team_id"
  add_foreign_key "players", "teams"
  add_foreign_key "teams", "conferences"
end
