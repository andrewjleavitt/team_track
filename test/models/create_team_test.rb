require "test_helper"

class CreateTeamTest < ActiveSupport::TestCase
  test "creates a team from attributes" do
    team_attributes = attributes_for(:team)

    assert_difference("Team.count") do
      CreateTeam.new(team_attributes)
    end
  end

  test "ignores duplicates" do
    team_attributes = attributes_for(:team)
    CreateTeam.new(team_attributes)

    assert_difference("Team.count", 0) do
      CreateTeam.new(team_attributes)
    end

  end
end
