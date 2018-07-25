class Team < ApplicationRecord
  validates :school, presence: true, uniqueness: { case_sensitive: false }
  validates :espn_id, uniqueness: true
  belongs_to :conference
  has_many :players
  has_many :team_seasons
  has_many :home_games, :class_name => 'Game', :foreign_key => 'home_team_id'
  has_many :away_games, :class_name => 'Game', :foreign_key => 'away_team_id'
end
