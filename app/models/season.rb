class Season < ApplicationRecord
  validates :start_year, presence: true, uniqueness: true
end
