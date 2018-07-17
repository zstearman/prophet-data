class Season < ApplicationRecord
  before_save :set_current
  validates :start_year, presence: true, uniqueness: true
  
  private
    def set_current
      Season.where.not(id: id).update_all(current: false)
    end
end
