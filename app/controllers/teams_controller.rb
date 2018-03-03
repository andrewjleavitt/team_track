class TeamsController < ApplicationController
  def index
    @teams = Teams.unique
  end
end
