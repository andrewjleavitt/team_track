require "application_system_test_case"

class WeeklyPlansTest < ApplicationSystemTestCase
  setup do
    team_a = create(:team, name: "Team A")
    team_b = create(:team, name: "Team B")
    team_c = create(:team, name: "Team C")

    project_a = create(:project, name: "Project A", status: "Green")
    project_a.assign_to team_a

    project_b = create(:project, name: "Project B", status: "Yellow")
    project_b.assign_to team_b

    project_c = create(:project, name: "Project Z")
    project_c.assign_to team_c

    project_a.start
    project_b.start
  end

  test "visiting a weekly plan" do
    visit weekly_plans_url

    assert_selector "h1", text: "Weekly Plan"
    assert_text "Team A"
    assert_text "Project A"
    assert_text Date.today.beginning_of_week
    assert_text "Green"
    assert_text "Team B"
    assert_text "Project B"
    assert_text Date.today.beginning_of_week + 1.week
    assert_text "Yellow"
    refute_text "Project Z"
  end

  test "visiting any week directly" do
    team = create(:team)

    manhattan_project = create(:project, name: "Manhattan Project")
    manhattan_project.assign_to team
    manhattan_project.start

    project_x = create(:project, name: "Project X")
    project_x.assign_to team
    project_x.start

    banbury_cross = create(:project, name: "Banbury Cross Donuts")
    banbury_cross.assign_to team
    banbury_cross.start(Week.current + 4.week)

    visit weekly_plan_url Week.weeks[5]
    assert_text "Manhattan Project"
    assert_text "Project X"
    refute_text "Banbury Cross Donuts"
  end

  test "paging between weeks" do
    team = create(:team)

    manhattan_project = create(:project, name: "Manhattan Project", start_at: Week.current)
    project_x = create(:project, name: "Project X", start_at: Week.current + 1.week)

    manhattan_project.assign_to team
    project_x.assign_to team

    visit weekly_plans_path
    assert_text "Manhattan Project"
    refute_text "Project X"

    click_on "Next"
    assert_text "Project X"

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
