require 'test_helper'

class AssignmentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get assignments_index_url
    assert_response :success
  end

  test "should get new" do
    get new_assignment_url
    assert_response :success
  end

  test "should create a new assignment" do
    assignment_params = {
      team_id: create(:team).id,
      person_id: create(:person).id
    }

    assert_difference('Assignment.count') do
      post assignments_url, params: {assignment: assignment_params}
    end

    assert_redirected_to assignments_url
  end
end
