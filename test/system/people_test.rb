require "application_system_test_case"

class PeopleTest < ApplicationSystemTestCase

  setup do
    @team = create(:team)
    @person = create(:person, name: "Gentleman Steve")
    assignment = create(:assignment, team: @team, person: @person)
  end

  test "visiting the index" do
    visit people_url

    assert_selector "h1", text: "People"
    assert_text "Gentleman Steve"
  end

  test "creating a person" do
    visit people_url
    click_on "New Person"
    fill_in "Name", with: @person.name
    click_on "Save"
    assert_text @person.name
  end

  test "editing a person" do
    visit people_url
    click_on @person.name
    click_on "Edit"
    fill_in "Name", with: "Ben Kenobi"
    click_on "Save"
    assert_text "Ben Kenobi"
  end
end
