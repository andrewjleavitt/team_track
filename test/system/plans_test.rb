require "application_system_test_case"

class PlansTest < ApplicationSystemTestCase

  test "visiting the index" do
    team_a = create(:team, name: "Team A")
    team_b = create(:team, name: "Team B")
    team_c = create(:team, name: "Team C")
    create(:assignment, team: team_a, person: create(:person, name: "Brandon"), role: "Team Lead", effective_date: Date.today.beginning_of_week)
    create(:assignment, team: team_a, person: create(:person, name: "Natalie"), role: "Product Manager", effective_date: Date.today.beginning_of_week)
    project_a = create(:project, name: "Project X", status: "Green")
    project_b = create(:project, name: "Project Y", status: "Yellow", due_at: Date.today.beginning_of_week + 2.weeks)
    project_c = create(:project, name: "Project Z", status: "Red", due_at: Date.today.beginning_of_week + 1.month)

    project_a.assign_to team_a
    project_b.assign_to team_b
    project_c.assign_to team_c

    create(:plan, team: team_a, week: Date.today.beginning_of_week)
    create(:plan, team: team_b, week: Date.today.beginning_of_week)
    create(:plan, team: team_c, week: Date.today.beginning_of_week + 1.week)

    visit plans_url

    assert_selector "h1", text: "Plans"
    assert_text "Team A"
    assert_text "Team Lead: Brandon"
    assert_text "Product Manager: Natalie"
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
    team = create(:team, name: 'Thunder Cats!')
    project = create(:project, due_at: due_date)

    project.assign_to team
    visit plans_url

    click_on "New Plan"
    select team.name, from: "plan[team_id]"
    select week, from: "plan[week]"
    click_on "Save"

    assert_text team.name
    assert_text project.name
    assert_text due_date
    assert_text project.status
    assert_text week
  end

  test "plan view shows all projects for a team" do
    team = create(:team, name: "Voltron")
    create(:project, team: team)
    create(:project, team: team)
    create(:plan, team: team, week: Date.today.beginning_of_week)

    visit weekly_plan_url Date.today.beginning_of_week
    assert_selector ".plan-label", count: 1
    assert_selector "li.project-list-item", count: 2
  end
end
