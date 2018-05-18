require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  test "#status_options" do
    assert_equal(["Green", "Yellow", "Red"], Project.status_options)
  end

  test "#team" do
    project = build(:project)
    team = build(:team)
    project.team = team
    assert_equal(team, project.team)
  end

  test "projects can be valide without a team assignment" do
    project = build(:project)
    project.team = nil
    assert(project.valid?)
  end
end
