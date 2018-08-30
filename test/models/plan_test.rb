require 'test_helper'

class PlanTest < ActiveSupport::TestCase
  test "#initialze with a week" do
    week = Week.current

    plan = Plan.new(week)
    assert_equal(week, plan.week)
  end

  test "#projects_for_week" do
    team = create(:team)
    create(:project, team: team, start_at: nil)
    create(:project, team: team, start_at: Week.current)
    create(:project, team: team, start_at: Week.current + 1.week)

    projects = Plan.new(Week.current).projects_for_week
    next_week_projects = Plan.new(Week.current + 1.week).projects_for_week

    assert_equal(1, projects.count)
    assert_equal(2, next_week_projects.count)
  end

  test "projects_for_week returns projects that are not complete" do
    team = create(:team)
    project = create(:project, team: team, start_at: Week.current)
    create(:project, team: team, start_at: Week.current)

    projects = Plan.new(Week.current).projects_for_week

    assert_equal(2, projects.count)

    project.complete
    assert_equal(1, projects.count)
  end
end
