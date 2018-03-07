require 'test_helper'

class WeeklyPlansControllerTest < ActionDispatch::IntegrationTest

  test "should get the index" do
    get weekly_plans_url
    assert_response :success
  end

  test "create should send an email" do
    team_a = create(:team, name: "Team A")
    team_b = create(:team, name: "Team B")
    team_c = create(:team, name: "Team C")
    project_a = create(:project, name: "Project A", status: "Green", due_at: Date.today.beginning_of_week + 1.week )
    project_b = create(:project, name: "Project B", status: "Red", due_at: Date.today.beginning_of_week + 1.week )
    project_c = create(:project, name: "Project A", status: "Yellow", due_at: Date.today.beginning_of_week + 1.week )
    plan_a = create(:plan, team: team_a.name, project: project_a, week: Date.today.beginning_of_week)
    plan_b = create(:plan, team: team_b.name, project: project_b, week: Date.today.beginning_of_week)
    plan_c = create(:plan, team: team_c.name, project: project_c, week: Date.today.beginning_of_week + 1.week)

    assert_difference 'ActionMailer::Base.deliveries.size', +1 do
      post weekly_plans_url
    end

    send_message = ActionMailer::Base.deliveries.last
    assert_equal "The Plan for the Week", send_message.subject
    assert_equal ['notifications@weekly-team-planner.herokuapp.com'], send_message.from
    assert_equal 'test@example.com', send_message.to[0]
    assert_match(/Hello Friendly Mavens!/, send_message.html_part.body.to_s)
    assert_match(/Team A/, send_message.html_part.body.to_s)
    assert_match(/Project A/, send_message.html_part.body.to_s)
    assert_match(/Team B/, send_message.html_part.body.to_s)
    assert_match(/Project B/, send_message.html_part.body.to_s)
    assert_response :redirect
  end
end