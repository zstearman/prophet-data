class TeamGame < ApplicationRecord
  belongs_to :game
  belongs_to :team
  belongs_to :team_season_id
  belongs_to :opponent, :class_name => 'Team', :foreign_key => 'opponent_id', :optional => true
  belongs_to :opponent_team_season, :class_name => 'TeamSeason', :foreign_key =>'opponent_team_season_id', :optional => true
end
