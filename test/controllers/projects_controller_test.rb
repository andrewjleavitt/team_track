require 'test_helper'

class ProjectsControllerTest < ActionDispatch::IntegrationTest

  test "should get index" do
    get projects_url
    assert_response :success
  end

  test "should get new" do
    get new_project_url
    assert_response :success
  end

  test "should create project" do
    project_attributes = attributes_for(:project)
    assert_difference('Project.count') do
      post projects_url, params: { project: project_attributes }
    end

    assert_match("Created #{project_attributes[:name]}", flash[:notice])
    assert_redirected_to projects_path
  end

  test "should get show" do
    project = create(:project)
    get project_url project
    assert_response :success
  end

  test "should get edit" do
    project = create(:project)
    get edit_project_url project
    assert_response :success
  end

  test "should update project" do
    project = create(:project)
    patch project_url(project), params: { project: { name: 'Updated Project Name' } }
    assert_redirected_to project_url(project)
  end
end
