require 'test_helper'

class PlansControllerTest < ActionDispatch::IntegrationTest

  test "should get index" do
    get plans_url
    assert_response :success
  end

  test "should get new" do
    get new_plan_url
    assert_response :success
  end

  test "should create plan" do
    plan_attributes = {
      team_id: create(:team).id,
      project_id: create(:project).id,
      week: Date.today.beginning_of_week
    }

    assert_difference('Plan.count') do
      post plans_url, params: { plan: plan_attributes }
    end

    assert_redirected_to plans_path
  end
end