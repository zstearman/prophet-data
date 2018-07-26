class RenameTpmForTeamSeason < ActiveRecord::Migration[5.2]
  def change
    rename_column :team_seasons, :tpm, :three_points_made
    rename_column :team_seasons, :tpa, :three_points_attempted
    rename_column :team_seasons, :tp_pct, :three_points_pct
    add_column :team_seasons, :two_points_made, :integer
    add_column :team_seasons, :two_points_attempted, :integer
    add_column :team_seasons, :two_points_pct, :decimal
  end
end
