class Season < ApplicationRecord
  before_save :set_current
  validates :start_year, presence: true, uniqueness: true
  has_many :games
  has_many :team_seasons
  
  private
    def set_current
      Season.where.not(id: id).update_all(current: false)
    end
end
