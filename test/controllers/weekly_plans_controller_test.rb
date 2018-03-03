require 'test_helper'

class WeeklyPlansControllerTest < ActionDispatch::IntegrationTest

  test "should get the index" do
    get weekly_plans_url
    assert_response :success
  end

  test "create should send an email" do
    assert_difference 'ActionMailer::Base.deliveries.size', +1 do
      post weekly_plans_url
    end
    send_message = ActionMailer::Base.deliveries.last
    assert_equal "The Plan for the Week", send_message.subject
    assert_equal ['notifications@weekly-team-planner.herokuapp.com'], send_message.from
    assert_equal 'test@example.com', send_message.to[0]
    assert_match(/Hello Friendly Mavens!/, send_message.html_part.body.to_s)
    assert_match(/A-Team/, send_message.html_part.body.to_s)
    assert_match(/Project X/, send_message.html_part.body.to_s)
    assert_match(/B-Team/, send_message.html_part.body.to_s)
    assert_match(/Project Y/, send_message.html_part.body.to_s)
    assert_response :redirect
  end
end