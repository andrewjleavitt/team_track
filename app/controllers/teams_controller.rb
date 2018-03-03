class TeamsController < ApplicationController
  def index
    @teams = Plan.all.pluck(:team).uniq
  end
end
