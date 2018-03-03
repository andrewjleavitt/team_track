require 'test_helper'

class TeamsControllerTest < ActionDispatch::IntegrationTest

  test "should get index" do
    get teams_url
    assert_response :success
    end

  test "should get new" do
    get new_team_url
    assert_response :success
  end

  test "should create team" do
    team_attributes = attributes_for(:team)
    assert_difference('Team.count') do
      post teams_url, params: { team: team_attributes }
    end

    assert_match("Created #{team_attributes[:name]}", flash[:notice])
    assert_redirected_to teams_path
  end
end
