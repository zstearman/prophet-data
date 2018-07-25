class AddIndexToEspnIdForGames < ActiveRecord::Migration[5.2]
  def change
    add_index :games, :espn_id
    add_column :games, :date, :date, index: true
    add_column :games, :home_team_id, :integer, index: true
    add_column :games, :away_team_id, :integer, index: true
    add_foreign_key :games, :teams, column: :home_team_id
    add_foreign_key :games, :teams, column: :away_team_id
    add_column :games, :home_team_season_id, :integer, index: true
    add_column :games, :away_team_season_id, :integer, index: true
    add_foreign_key :games, :team_seasons, column: :home_team_season_id
    add_foreign_key :games, :team_seasons, column: :away_team_season_id
    rename_column :games, :home_team, :home_team_name
    rename_column :games, :away_team, :away_team_name
  end
end
