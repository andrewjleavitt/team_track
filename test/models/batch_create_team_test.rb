require "test_helper"

class BatchCreateTeamTest < ActiveSupport::TestCase
  test "creates teams from a file" do
    path = file_fixture('teams_log.csv')

    assert_difference("Team.count", 9) do
      BatchCreateTeam.new(path)
    end
  end
end