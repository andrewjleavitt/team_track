require "application_system_test_case"

class PlansTest < ApplicationSystemTestCase
  setup do
    team_a = create(:team, name: "Team A")
    team_b = create(:team, name: "Team B")
    team_c = create(:team, name: "Team C")
    project_a = create(:project, name: "Project X", status: "Green")
    project_b = create(:project, name: "Project Y", status: "Yellow", due_at: Date.today.beginning_of_week + 2.weeks)
    project_c = create(:project, name: "Project Z", status: "Red", due_at: Date.today.beginning_of_week + 1.month)

    create(:plan, team: team_a.name, project: project_a, week: Date.today.beginning_of_week)
    create(:plan, team: team_b.name, project: project_b, week: Date.today.beginning_of_week)
    create(:plan, team: team_c.name, project: project_c, week: Date.today.beginning_of_week + 1.week)
  end

  test "visiting the index" do
    visit plans_url

    assert_selector "h1", text: "Plans"
    assert_text "Team A"
    assert_text "Project X"
    assert_text Date.today.beginning_of_week + 1.week
    assert_text "Green"
    assert_text Date.today.beginning_of_week

    assert_text "Team B"
    assert_text "Project Y"
    assert_text Date.today.beginning_of_week + 2.week
    assert_text "Yellow"
    assert_text Date.today.beginning_of_week

    assert_text "Team C"
    assert_text "Project Z"
    assert_text Date.today.beginning_of_week + 1.month
    assert_text "Red"
    assert_text Date.today.beginning_of_week + 1.week
  end

  test "creating a plan" do
    due_date = Date.today + 1.month
    week = Date.today.beginning_of_week
    team = create(:team)
    project = create(:project, due_at: due_date)

    visit plans_url

    click_on "New Plan"
    select team.name, from: "plan[team]"
    select project.name, from: "plan[project_id]"
    select week, from: "plan[week]"
    click_on "Save"

    assert_text team.name
    assert_text project.name
    assert_text due_date
    assert_text project.status
    assert_text week
  end
end
