require "application_system_test_case"

class ProjectCategoriesTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit project_categories_url

    assert_selector "h1", text: "Project Categories"
  end

  test "adding a project category" do
    visit project_categories_url

    click_on "New project category"
    fill_in "Name", with: "Comic Books"
    click_on "Save"

    assert_selector "li.project-category", text: "Comic Books"
  end

  test "viewing a project category page" do
    project_category = ProjectCategory.create(name: "Category")
    project = Project.create(name: "Name")


    project.project_category = project_category
    project.save

    visit project_categories_path
    click_on project_category.name

    assert_selector "tr.project-list-item", text: project.name
  end
end
