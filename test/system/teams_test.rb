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

  test "viewing team details shows members who are assigned to a team" do
    team = create(:team, name: "Super-Squad!")
    person = create(:person)
    assignment = create(:assignment, team: team, person: person)

    visit teams_url
    click_on team.name

    assert_selector "h1", text: team.name
    assert_selector "h2", text: "Team Membership"

    assert_selector "li.team-member", text: person.name
  end

end
