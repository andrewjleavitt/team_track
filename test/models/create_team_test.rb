require "test_helper"

class CreateTeamTest < ActiveSupport::TestCase
  test "creates a team from attributes" do
    team_attributes = attributes_for(:team)

    assert_difference("Team.count") do
      CreateTeam.new(team_attributes)
    end
  end
end
