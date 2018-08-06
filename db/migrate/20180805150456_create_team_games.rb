class CreateTeamGames < ActiveRecord::Migration[5.2]
  def change
    create_table :team_games do |t|
      t.belongs_to :game_id
      t.belongs_to :team_id
      t.belongs_to :team_season_id
      t.integer :opponent_id
      t.integer :opponent_team_season_id
      t.integer :opponent_team_game_id
      t.string :type
      t.boolean :conference
      t.integer :minutes
      t.integer :score
      t.integer :opponent_score
      t.string :period
      t.integer :wins
      t.integer :losses
      t.integer :conference_wins
      t.integer :conference_losses
      t.integer :points
      t.integer :points_allowed
      t.integer :fgm
      t.integer :fga
      t.decimal :fg_pct
      t.integer :three_points_made
      t.integer :three_points_attempted
      t.decimal :three_points_pct
      t.integer :two_points_made
      t.integer :two_points_attempted
      t.decimal :two_points_pct
      t.integer :ftm
      t.integer :fta
      t.decimal :ft_pct
      t.integer :oreb
      t.integer :dreb
      t.integer :rebounds
      t.decimal :oreb_pct
      t.decimal :dreb_pct
      t.decimal :reb_pct
      t.integer :assists
      t.decimal :assists_pct
      t.integer :tov
      t.decimal :tov_pct
      t.integer :steals
      t.decimal :steals_pct
      t.integer :blocks
      t.decimal :blocks_pct
      t.integer :fouls
      t.integer :fouls_drawn
      t.decimal :eft_pct
      t.decimal :ts_pct
      t.decimal :ftm_fga
      t.decimal :pace
      t.decimal :o_rtg
      t.decimal :d_rtg
      t.timestamps
    end
  end
end
