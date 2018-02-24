require "application_system_test_case"

class WeeklyPlansTest < ApplicationSystemTestCase
  setup do
  end

  test "visiting the current week" do
    visit weekly_plans_url

    assert_selector "h1", text: "Weekly Plan"
    assert_text "A-Team"
    assert_text "Project X"
    assert_text Date.today + 1.week
    assert_text "Green"
    assert_text "B-Team"
    assert_text "Project Y"
    assert_text Date.today + 2.week
    assert_text "Yellow"
    refute_text "Project Z"
  end

  test "emailing a weekly plan" do
    visit weekly_plans_url
    click_button "Send the message"
    assert_text "Message sent."
  end
end
