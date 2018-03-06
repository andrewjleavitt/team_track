require 'test_helper'

class TeamTest < ActiveSupport::TestCase
  test "#members_for" do
    team = create(:team)
    member = create(:member, team: team.name)

    assert_equal([member], Team.members_for(team.name))
  end
end
