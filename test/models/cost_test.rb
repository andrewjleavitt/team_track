require 'test_helper'

class CostTest < ActiveSupport::TestCase
  test "returns the cost of a project" do
    project = create(:project)
    team = create(:team)
    person = create(:person)
    person.assign_to(team, 6.weeks.ago.beginning_of_week)
    project.assign_to(team)
    project.start(4.weeks.ago)
    project.complete

    assert_equal(8_000, Cost.for(project).cost)
  end

  test "a project that does not have a complete date uses the current week to determine cost" do
    project = create(:project)
    team = create(:team)
    person = create(:person)
    person.assign_to(team, 6.weeks.ago.beginning_of_week)
    project.assign_to(team)
    project.start(4.weeks.ago)

    assert_equal(8_000, Cost.for(project).cost)
  end

  test "a project that has not started cost 0" do
    project = create(:project)
    team = create(:team)
    person = create(:person)
    person.assign_to(team, 6.weeks.ago.beginning_of_week)
    project.assign_to(team)

    assert_equal(0, Cost.for(project).cost)
  end

  test "a project that is not assigned to a team cost 0" do
    project = create(:project)

    assert_equal(0, Cost.for(project).cost)
  end

end
