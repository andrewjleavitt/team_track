require 'test_helper'

class WeeklyPlanMailerTest < ActionMailer::TestCase
  test "send_plan.html.erb" do
    email = WeeklyPlanMailer.send_plan

    assert_emails 1 do
      email.deliver_now
    end

    assert_equal ['notifications@weekly-team-planner.herokuapp.com'], email.from
    assert_equal ['aleavitt@mavenlink.com'], email.to
    assert_equal "The Plan for the Week", email.subject
  end
end
