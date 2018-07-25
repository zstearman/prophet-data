class Conference < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :teams
  has_many :team_seasons
end
