require "application_system_test_case"

class TeamsTest < ApplicationSystemTestCase
  setup do
    Team.create(name: "A-Team")
    Team.create(name: "B-Team")
    Team.create(name: "C-Team")
  end

  test "visiting the index" do
    visit teams_url

    assert_selector "h1", text: "Teams"

    assert_selector "li.team", text: "A-Team"
    assert_selector "li.team", text: "B-Team"
    assert_selector "li.team", text: "C-Team"
  end

  test "creating a new team" do
    visit teams_url
    click_on "New Team"
    fill_in "team[name]", with: "The Scuba Squad"
    click_on "Save"
    assert_text "Created The Scuba Squad"
    assert_selector "li.team", text: "The Scuba Squad"
  end

  test "viewing team details shows members who are currently assigned to a team" do
    team = create(:team, name: "Super-Squad!")
    person = create(:person)
    effective_week = Week.current - 1.week
    assignment = create(:assignment, team: team, person: person, role: "Ninja", effective_date: effective_week)

    visit teams_url
    click_on team.name

    assert_selector "h1", text: team.name
    assert_selector "h2", text: "Team Membership"

    assert_text person.name
    assert_text assignment.role
    assert_text effective_week
  end

  test "viewing team details show projectes assigned to the team ordered by due date" do
    team = create(:team, name: "Super-Squad!")
    project = create(:project, team: team, due_at: '2018-01-08')
    create(:project, name: "Expedited Project", team: team, due_at: '2018-01-01')

    visit team_url team

    assert_text team.name
    assert_text "Current Projects"

    assert_selector ".project-name", text: project.name
  end

  test "viewing the membership history of a team" do
    team = create(:team, name: "Super-Squad")
    person1 = create(:person, name: "Captain Amazing")
    person2 = create(:person, name: "The Shoveler")
    create(:person, name: "Waffle Man")

    person1.assign_to team, Week.current - 1.week
    person2.assign_to team

    visit team_url team
    click_on "History"

    assert_text "Captain Amazing"
    assert_text "The Shoveler"

    click_on "Previous"

    assert_text "Captain Amazing"
    refute_text "The Shoveler"
  end
end
