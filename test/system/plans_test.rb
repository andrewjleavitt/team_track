require "application_system_test_case"

class PlansTest < ApplicationSystemTestCase

  test "visiting the index" do
    visit plans_url

    assert_selector "h1", text: "Plans"
    assert_text "A-Team"
    assert_text "Project X"
    assert_text Date.today + 1.week
    assert_text "Green"
    assert_text Date.today.beginning_of_week

    assert_text "B-Team"
    assert_text "Project Y"
    assert_text Date.today + 2.week
    assert_text "Yellow"
    assert_text Date.today.beginning_of_week

    assert_text "C-Team"
    assert_text "Project Z"
    assert_text Date.today + 1.month
    assert_text "Red"
    assert_text Date.today.beginning_of_week + 1.week
  end

  test "creating a plan" do
    due_date = Date.today + 1.month
    week = Date.today.beginning_of_week

    visit plans_url
    click_on "New Plan"
    select "A-Team", from: "plan[team]"
    fill_in "plan[project]", with: "World Peace"
    fill_in "plan[project_due]", with: due_date
    fill_in "plan[project_status]", with: "Green"
    select week, from: "plan[week]"
    click_on "Save"

    assert_text "A-Team"
    assert_text "World Peace"
    assert_text due_date
    assert_text "Green"
    assert_text week
  end
end
