require "application_system_test_case"

class TeamsTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit teams_url

    assert_selector "h1", text: "Teams"

    assert_selector "li.team", text: "A-Team"
    assert_selector "li.team", text: "B-Team"
    assert_selector "li.team", text: "C-Team"
  end
end
