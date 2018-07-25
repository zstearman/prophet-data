class TeamSeason < ApplicationRecord
  belongs_to :team
  belongs_to :conference
  belongs_to :season
  has_many :home_games, :class_name => 'Game', :foreign_key => 'home_team_season_id'
  has_many :away_games, :class_name => 'Game', :foreign_key => 'away_team_season_id'
end
