class GamesController < ApplicationController
  def index
    if params[:date]
      date = Date.strptime(params[:date], '%Y%m%d')
      @games = Game.where(date: date).all
    else
      @games = Game.where(date: Date.today).all
    end
  end
end
