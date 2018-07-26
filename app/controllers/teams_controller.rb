class TeamsController < ApplicationController
  def index
    @teams = Team.all.order(:id)
  end
  
  def show
    @team = Team.find(params[:id])
    @team_season = TeamSeason.where(team: @team).first
    @home_games = @team_season.home_games
    @away_games = @team_season.away_games
    @games = @home_games + @away_games
  end
end
