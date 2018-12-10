require "application_system_test_case"

class ProjectsTest < ApplicationSystemTestCase
  setup do
    team = create(:team, name: "Captain Planet")
    project_attributes = {team: team, status: "Green", due_at: "2018-01-01", complete_at: "2018-01-08"}
    create(:project, project_attributes)
    create(:project, name: "No Team Project", team: nil)
  end

  test "visiting the index" do
    visit projects_url

    assert_selector "h1", text: "Projects"
    assert_selector ".project-name", text: "World Peace"
    assert_selector ".project-team", text: "Captain Planet"
    assert_selector ".project-status", text: "Green"
    assert_selector ".project-due-at", text: "2018-01-01"
    assert_selector ".project-complete-at", text: "2018-01-08"

    assert_selector ".project-name", text: "No Team Project"
    assert_selector ".project-team", text: "Unassigned"
  end

  test "creating a new project" do
    team = create(:team, name: "The B-Team")
    visit projects_url
    click_on "New Project"
    fill_in "project[name]", with: "Doomsday Project"
    select "The B-Team", from: "project[team_id]"
    click_on "Save"
    assert_text "Created Doomsday Project"
    assert_selector ".project-name", text: "Doomsday Project"
    assert_selector ".project-team", text: "The B-Team"
    assert_link "a", text: team.name, href: team_path(team)
  end

  test "viewing project details" do
    project = create(:project, name: "Take Over the World")
    visit projects_url
    click_on project.name
    assert_selector "h1", text: "Take Over the World"
  end

  test "finishing a project from the project details page" do
    project = create(:project, name: "Take Over the World")
    visit project_path project
    click_button "Finish Project"
    assert_text "Finished"
  end

  test "setting a project due date" do
    project = create(:project, name: "Take Over the World")
    project_due_date = Date.today + 1.month

    visit projects_url

    click_on project.name
    click_on "Edit"
    fill_in "project[due_at]", with: project_due_date
    click_on "Save"

    assert_text project_due_date
  end

  test "setting a project start date" do
    project = create(:project, name: "Take Over the World")
    project_start_date = Date.today.beginning_of_week

    visit projects_url

    click_on project.name
    click_on "Edit"
    fill_in "project[start_at]", with: project_start_date
    click_on "Save"

    assert_text project_start_date
  end

  test "setting a project complete date" do
    project = create(:project, name: "Take Over the World")
    project.start Week.current - 2.weeks

    projected_complete_date = Week.current

    visit projects_url

    click_on project.name
    click_on "Edit"
    fill_in "project[complete_at]", with: projected_complete_date
    click_on "Save"

    assert_text projected_complete_date
  end

  test "assigning a project to a project category" do
    project = create(:project, name: "Take Over the World")
    project_category = ProjectCategory.create(name: "Doomsday Scenarios")

    visit projects_url
    click_on project.name
    click_on "Edit"
    select project_category.name, from: "project[project_category_id]"
    click_on "Save"

    assert_text project_category.name
  end

  test "project cost" do
    project = create(:project, name: "Pricey Project")

    visit projects_url
    click_on project.name
    click_on "Edit"
    fill_in "project[cost]", with: 500
    click_on "Save"

    assert_text "Project Cost: 500"
  end
end
