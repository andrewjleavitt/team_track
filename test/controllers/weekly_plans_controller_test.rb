require "test_helper"

class WeeklyPlansControllerTest < ActionDispatch::IntegrationTest
  test "should get the index" do
    get weekly_plans_url
    assert_response :success
  end

  test "create should send an email" do
    team_a = create(:team, name: "Team A")
    create(:assignment, team: team_a, person: create(:person, name: "Jim"))
    create(:assignment, team: team_a, person: create(:person, name: "Fred"))
    team_b = create(:team, name: "Team B")
    team_c = create(:team, name: "Team C")
    project_a = create(:project, name: "Project A", status: "Green", due_at: Date.today.beginning_of_week + 1.week)
    project_b = create(:project, name: "Project B", status: "Red", due_at: Date.today.beginning_of_week + 1.week)
    project_c = create(:project, name: "Project c", status: "Yellow", due_at: Date.today.beginning_of_week + 1.week)

    project_a.assign_to team_a
    project_a.start

    project_b.assign_to team_b
    project_b.start

    project_c.assign_to team_c
    project_c.start

    assert_difference "ActionMailer::Base.deliveries.size", +1 do
      post weekly_plans_url
    end

    send_message = ActionMailer::Base.deliveries.last
    assert_equal "The Plan for the Week", send_message.subject
    assert_equal ["notifications@weekly-team-planner.herokuapp.com"], send_message.from
    assert_equal "test@example.com", send_message.to[0]
    assert_match(/Hello Friendly Mavens!/, send_message.html_part.body.to_s)
    assert_match(/Team A/, send_message.html_part.body.to_s)
    assert_match(/Members: Jim, Fred/, send_message.html_part.body.to_s)
    assert_match(/Project A/, send_message.html_part.body.to_s)
    assert_match(/Team B/, send_message.html_part.body.to_s)
    assert_match(/Project B/, send_message.html_part.body.to_s)
    assert_response :redirect
  end

  test "should get show" do
    get weekly_plans_url Week.weeks[0]
    assert_response :success
  end
end
