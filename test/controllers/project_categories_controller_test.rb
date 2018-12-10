require "test_helper"

class ProjectCategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get project_categories_url
    assert_response :success
  end

  test "should get show" do
    project_category = ProjectCategory.create(name: "Tigers")
    get project_category_url project_category
    assert_response :success
  end

  test "should get new" do
    get new_project_category_url
    assert_response :success
  end

  test "should create project category" do
    project_category_attributes = {name: "abcdef"}
    assert_difference("ProjectCategory.count") do
      post project_categories_url, params: {project_category: project_category_attributes}
    end

    assert_match("Created #{project_category_attributes[:name]}", flash[:notice])
    assert_redirected_to project_categories_path
  end
end
