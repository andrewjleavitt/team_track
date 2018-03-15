require "application_system_test_case"

class AssignmentsTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit assignments_url

    assert_selector "h1", text: "Assignments"
  end

  test "assigning a person to a team" do
    create(:person, name: "Mr. T")
    create(:team, name: "A-Team")

    visit assignments_url
    click_on "New Assignment"
    select "Mr. T", from: "assignment[person_id]"
    select "A-Team", from: "assignment[team_id]"
    click_on "Save"
    assert_selector ".notice", text: "Mr. T has been assigned to A-Team"
    assert_selector "li.assignment", text: "Mr. T, A-Team"
  end
end
