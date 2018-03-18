class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def new
    @team = Team.new
  end

  def create
    team = Team.create(team_params)
    flash.notice = "Created #{team.name}"
    redirect_to teams_path
  end

  def show
    @team = Team.find(params[:id])
  end

  private

  def team_params
    params.require(:team).permit(:name)
  end

end
