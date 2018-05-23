require "application_system_test_case"

class WeeklyPlansTest < ApplicationSystemTestCase
  setup do
    team_a = create(:team, name: "Team A")
    team_b = create(:team, name: "Team B")
    team_c = create(:team, name: "Team C")
    project_a = create(:project, status: "Green")
    project_b = create(:project, status: "Yellow")
    project_c = create(:project, name: "Project Z")

    project_a.assign_to team_a
    project_b.assign_to team_b
    project_c.assign_to team_c

    @plan_a = create(:plan, team: team_a, week: Date.today.beginning_of_week)
    @plan_b = create(:plan, team: team_b, week: Date.today.beginning_of_week)
    create(:plan, team: team_c, week: Date.today.beginning_of_week + 1.week)
  end

  test "visiting a weekly plan" do
    visit weekly_plans_url

    assert_selector "h1", text: "Weekly Plan"
    assert_text "Team A"
    assert_text @plan_a.project.name
    assert_text Date.today.beginning_of_week
    assert_text "Green"
    assert_text "Team B"
    assert_text @plan_b.project.name
    assert_text Date.today.beginning_of_week + 1.week
    assert_text "Yellow"
    refute_text "Project Z"
  end

  test "visiting any week directly" do
    team = create(:team)
    manhattan_project = create(:project, name: "Manhattan Project")
    project_x = create(:project, name: "Project X")
    banbury_cross = create(:project, name: "Banbury Cross Donuts")

    manhattan_project.assign_to team
    project_x.assign_to team
    banbury_cross.assign_to team

    create(:plan, team: team, week: Week.weeks[5])
    create(:plan, team: team, week: Week.weeks[5])
    create(:plan, team: team, week: Week.weeks[4])

    visit weekly_plan_url Week.weeks[5]
    assert_text "Manhattan Project"
    assert_text "Project X"
  end

  test "paging between weeks" do
    skip "need to rethink how project start dates are defined"
    team = create(:team)

    manhattan_project = create(:project, name: "Manhattan Project")
    project_x = create(:project, name: "Project X")

    manhattan_project.assign_to team
    project_x.assign_to team

    plan_1 = create(:plan, team: team, week: Week.current)
    plan_2 = create(:plan, team: team, week: Week.current + 1.week)

    visit weekly_plans_path
    assert_text "Manhattan Project"

    click_on "Next"
    assert_text "Project X"
    refute_text "Manhattan Project"

    click_on "Previous"
    assert_text "Manhattan Project"
    refute_text "Project X"
  end

  test "emailing a weekly plan" do
    visit weekly_plans_url
    click_button "Send the message"
    assert_text "Message sent."
  end
end
