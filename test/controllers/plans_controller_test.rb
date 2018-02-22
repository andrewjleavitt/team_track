require 'test_helper'

class PlansControllerTest < ActionDispatch::IntegrationTest

  setup do
    @plan = plans(:one)
  end

  test "should get index" do
    get plans_url
    assert_response :success
  end

  test "should get new" do
    get new_plan_url
    assert_response :success
  end

  test "should create plan" do
    plan_attributes = @plan.attributes
    assert_difference('Plan.count') do
      post plans_url, params: { plan: plan_attributes }
    end

    assert_redirected_to plans_path
  end
end