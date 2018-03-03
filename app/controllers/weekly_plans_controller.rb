class WeeklyPlansController < ApplicationController

  def index
    @plans = Plan.current_plan
  end

  def create
    WeeklyPlanMailer.send_plan.deliver_now
    flash.notice = "Message sent."
    redirect_to weekly_plans_url
  end
end
