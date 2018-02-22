require 'test_helper'

class WeeklyPlansControllerTest < ActionDispatch::IntegrationTest

  test "should get the index" do
    get weekly_plans_url
    assert_response :success
  end
end