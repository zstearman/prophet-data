class CreateTeamSeasons < ActiveRecord::Migration[5.2]
  def change
    create_table :team_seasons do |t|

      t.timestamps
      t.belongs_to :team
      t.belongs_to :season
      t.belongs_to :conference
      t.string :type
      t.integer :games_played
      t.integer :minutes
      t.integer :wins
      t.integer :losses
      t.integer :conf_games_played
      t.integer :conf_wins
      t.integer :conf_losses
      t.decimal :win_pct
      t.decimal :conf_win_pct
      t.integer :points
      t.decimal :points_per_game
      t.integer :fgm
      t.decimal :fgm_per_game
      t.integer :fga
      t.decimal :fga_per_game
      t.decimal :fg_pct
      t.integer :tpm
      t.decimal :tpm_per_game
      t.integer :tpa
      t.decimal :tpa_per_game
      t.decimal :tp_pct
      t.integer :ftm
      t.decimal :ftm_per_game
      t.integer :fta
      t.decimal :fta_per_game
      t.decimal :ft_pct
      t.integer :oreb
      t.decimal :oreb_per_game
      t.integer :dreb
      t.decimal :dreb_per_game
      t.integer :rebounds
      t.decimal :rebounds_per_game
      t.integer :assists
      t.decimal :assistes_per_game
      t.integer :tov
      t.decimal :tov_per_game
      t.integer :steals
      t.decimal :steals_per_game
      t.integer :blocks
      t.decimal :blocks_per_game
      t.integer :blka
      t.decimal :blka_per_game
      t.integer :fouls
      t.decimal :fouls_per_game
      t.integer :fouls_drawn
      t.decimal :fouls_drawn_per_game
      t.integer :point_diff
      t.decimal :point_diff_per_game
    end
  end
end
