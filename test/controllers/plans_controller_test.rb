require 'test_helper'

class PlansControllerTest < ActionDispatch::IntegrationTest

  setup do
    @plan = plans(:one)
  end
  test "should get index" do
    get plans_url
    assert_response :success
  end
end