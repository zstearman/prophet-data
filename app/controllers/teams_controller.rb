class TeamsController < ApplicationController
  def index
    @teams = Team.all.order(:id)
  end
  
  def show
    @team = Team.find(params[:id])
  end
end
