module SeasonsHelper
  # returns current season if any
  def current_season
    if @current_season
      @current_season
    else
      @current_season = Season.where(current: true).first
    end
  end
end
