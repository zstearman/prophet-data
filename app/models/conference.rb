class Conference < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :teams
end
