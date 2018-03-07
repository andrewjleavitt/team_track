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

  test "viewing project details" do
    project = create(:project, name: "Take Over the World")
    visit projects_url
    click_on project.name
    assert_selector "h1", text: "Take Over the World"
  end

  test "setting a project due date" do
    project = create(:project, name: "Take Over the World")
    project_due_date = Date.today + 1.month

    visit projects_url

    click_on project.name
    click_on "Edit"
    fill_in "project[due_at]", with: project_due_date
    select "Yellow", from: project[status]
    click_on "Save"

    assert_text project_due_date
    assert_text "Yellow"
  end

end
