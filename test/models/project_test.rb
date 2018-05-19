require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  test "#status_options" do
    assert_equal(["Green", "Yellow", "Red"], Project.status_options)
  end

  test "name is required" do
    assert_not(build(:project, name: nil).valid?)
  end

  test "#team" do
    project = build(:project)
    team = build(:team)
    project.team = team
    assert_equal(team, project.team)
  end

  test "#team_name" do
    project = build(:project)
    team = build(:team)
    project.team = team
    assert_equal(team.name, project.team_name)

    project2 = build(:project, team: nil)
    assert_equal("Unassigned", project2.team_name)
  end

  test "projects can be valide without a team assignment" do
    project = build(:project)
    project.team = nil
    assert(project.valid?)
  end
end
