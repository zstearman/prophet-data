class Conference < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
