class WeeklyPlansController < ApplicationController
  def index
    @plan = Plan.new(current_week)
    @next_week = current_week + 1.week
    @previous_week = current_week - 1.week
  end

  def show
    @teams = Team.all
    week = params[:id].to_date
    @next_week = week + 1.week
    @previous_week = week - 1.week
    @plan = Plan.new(week)
  end

  def create
    WeeklyPlanMailer.send_plan.deliver_now
    flash.notice = "Message sent."
    redirect_to weekly_plans_url
  end

  private

  def current_week
    Week.current
  end
end
