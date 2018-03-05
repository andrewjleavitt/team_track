require "application_system_test_case"

class ProjectsTest < ApplicationSystemTestCase
  setup do
    create(:project)
  end

  test "visiting the index" do
    visit projects_url

    assert_selector "h1", text: "Projects"

    assert_selector "li.project", text: "World Peace"
  end

  test "creating a new project" do
    visit projects_url
    click_on "New Project"
    fill_in "project[name]", with: "Doomsday Project"
    click_on "Save"
    assert_text "Created Doomsday Project"
    assert_selector "li.project", text: "Doomsday Project"
  end
end
