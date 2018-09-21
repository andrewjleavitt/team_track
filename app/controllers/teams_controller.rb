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
    @team_projects = @team.projects
  end

  def history
    @week = params[:week].nil? ? Week.current : params[:week].to_date
    @previous_week = @week - 1.week
    @next_week = @week + 1.week
    @team = Team.find(params[:id])
    @memberships = @team.active_assignments @week
  end

  private

  def team_params
    params.require(:team).permit(:name)
  end
end
