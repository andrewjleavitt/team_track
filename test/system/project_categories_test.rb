require "application_system_test_case"

class ProjectCategoriesTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit project_categories_url

    assert_selector "h1", text: "Project Categories"
  end

  test "adding a project category" do
    visit project_categories_url

    click_on "New project category"
    fill_in :"Name", with: "Comic Books"
    click_on "Save"

    assert_selector "li.project-category", text: "Comic Books"
  end
end
