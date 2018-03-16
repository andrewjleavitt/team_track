require "application_system_test_case"

class AssignmentsTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit assignments_url

    assert_selector "h1", text: "Assignments"
  end

  test "assigning a person to a team" do
    create(:person, name: "Mr. T")
    create(:team, name: "A-Team")
    effective_date = Date.today.beginning_of_week + 1.week

    visit assignments_url
    click_on "New Assignment"
    select "Mr. T", from: "assignment[person_id]"
    select "A-Team", from: "assignment[team_id]"
    select effective_date, from: "assignment[effective_date]"
    click_on "Save"
    assert_selector ".notice", text: "Mr. T has been assigned to A-Team"
    assert_selector "li.assignment", text: "Mr. T, A-Team, #{effective_date}"
  end

  test "completing an assignment" do
    completion_date = Date.today.beginning_of_week
    effective_date = Date.today.beginning_of_week - 1.week
    assignment = create(:assignment, team: create(:team), person: create(:person), effective_date: effective_date, completion_date: nil)

    visit assignments_url
    within "li.assignment", text: assignment.person.name do
      click_on "Edit"
    end
    select completion_date, from: "assignment[completion_date]"
    click_on "Save"

    assert_selector "li.assignment", text: "#{assignment.person.name}, #{assignment.team.name}, #{effective_date}, #{completion_date}"
  end
end
