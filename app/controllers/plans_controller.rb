class PlansController < ApplicationController
  def index
    @plans = Plan.all
  end

  def new
    @weeks = Plan.weeks
    @teams = Team.all
    @projects = Project.all
  end

  def create
    Plan.create(plan_params)
    redirect_to(plans_url)
  end

  private

  def plan_params
    params.require(:plan).permit(:team, :project_id, :week)
  end
end