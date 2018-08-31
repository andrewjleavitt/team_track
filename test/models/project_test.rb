require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  test "#status_options" do
    assert_equal(["Green", "Yellow", "Red"], Project.status_options)
  end

  test "name is required" do
    assert_not(build(:project, name: nil).valid?)
  end

  test "#team_name" do
    project = build(:project)
    team = build(:team)
    project.team = team
    assert_equal(team.name, project.team_name)

    project2 = build(:project, team: nil)
    assert_equal("Unassigned", project2.team_name)
  end

  test "#assign_to" do
    project = create(:project)
    team = create(:team)
    project.assign_to team
    project.reload
    assert_equal(team, project.team)
  end

  test "#start" do
    project = build(:project)
    project.start(Week.current)

    other_project = build(:project)
    other_project.start

    assert_equal(project.start_at, Week.current)
    assert_equal(other_project.start_at, Week.current)
  end

  test "projects can be valid without a team assignment" do
    project = build(:project)
    project.team = nil
    assert(project.valid?)
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

  test "#for_week returns projects that are not complete" do
    team = create(:team)
    project = create(:project, team: team, start_at: Week.current)
    create(:project, team: team, start_at: Week.current)

    projects = Project.for_week(Week.current)

    assert_equal(2, projects.count)

    project.complete

    projects = Project.for_week(Week.current + 1.week)
    assert_equal(1, projects.count)
  end

  test "#for_week includes projects that are completed after a given week" do
    create(:project, start_at: Week.current - 1.week, complete_at: Week.current + 1.week)

    assert_equal(1, Project.for_week(Week.current).count)
  end
end
