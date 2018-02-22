class WeeklyPlansController < ApplicationController
  def index
    @plans = Plan.where(week: Date.today.beginning_of_week)
  end
end
