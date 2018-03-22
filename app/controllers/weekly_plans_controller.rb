class WeeklyPlansController < ApplicationController
  def index
    week = Week.current
    @plans = Plan.for_week week
    @next_week = week + 1.week
    @previous_week = week - 1.week
  end

  def show
    @week = params[:id].to_date
    @next_week = @week + 1.week
    @previous_week = @week - 1.week
    @plans = Plan.for_week @week
  end

  def create
    WeeklyPlanMailer.send_plan.deliver_now
    flash.notice = "Message sent."
    redirect_to weekly_plans_url
  end
end
