class PlansController < ApplicationController
  def index
    @plans = Plan.all
  end

  def new
  end

  def create
    Plan.create(plan_params)
    redirect_to(plans_url)
  end

  private

  def plan_params
    params.require(:plan).permit(:team, :project, :project_due, :project_status)
  end
end