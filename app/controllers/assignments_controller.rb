class AssignmentsController < ApplicationController
  def index
    @assignments = Assignment.all
  end

  def new
    @people = Person.all
    @teams = Team.all
    @assignment = Assignment.new
    @weeks = Weeks.weeks
  end

  def create
    assignment =  Assignment.create!(assignment_params)
    flash.notice = "#{assignment.person.name} has been assigned to #{assignment.team.name}"
    redirect_to assignments_url
  end

  private

  def assignment_params
    params.require(:assignment).permit(:team_id, :person_id)
  end
end
