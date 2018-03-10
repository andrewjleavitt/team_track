require "application_system_test_case"

class WeeklyPlansTest < ApplicationSystemTestCase
  setup do
    team_a = create(:team, name: "Team A")
    team_b = create(:team, name: "Team B")
    team_c = create(:team, name: "Team C")
    project_a = create(:project, status: "Green")
    project_c = create(:project, name: "Project Z")
    @plan_a = create(:plan, team: team_a, project: project_a, week: Date.today.beginning_of_week)
    @plan_b = create(:plan, team: team_b, week: Date.today.beginning_of_week)
    plan_c = create(:plan, team: team_c, week: Date.today.beginning_of_week + 1.week)
  end

  test "visiting the current week" do
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

  test "emailing a weekly plan" do
    visit weekly_plans_url
    click_button "Send the message"
    assert_text "Message sent."
  end
end
