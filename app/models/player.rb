class Player < ApplicationRecord
  validates :espn_id, uniqueness: true
  belongs_to :team
end
