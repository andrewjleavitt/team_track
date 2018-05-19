require "application_system_test_case"

class ProjectsTest < ApplicationSystemTestCase
  setup do
    team = create(:team, name: "Captain Planet")
    project_attributes = {team: team, status: "Green", due_at: "2018-01-01"}
    create(:project, project_attributes)
    create(:project, name: "No Team Project", team: nil)
  end

  test "visiting the index" do
    visit projects_url

    assert_selector "h1", text: "Projects"
    assert_selector "li.project", text: "World Peace"
    assert_selector "li.team", text: "Captain Planet"
    assert_selector "li.project-status", text: "Green"
    assert_selector "li.project-due-at", text: "2018-01-01"

    assert_selector "li.project", text: "No Team Project"
    assert_selector "li.team", text: "Unassigned"
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
