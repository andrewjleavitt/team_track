require 'test_helper'

class MemberTest < ActiveSupport::TestCase
  test "#current_team returns the current team when team is set" do
    team = create(:team)
    member = create(:member, team_id: team.id)

    assert_equal(team, member.current_team)
  end

  test "can create without team" do
    assert_difference('Member.count') do
      Member.create(name: "I ride in a pack of one")
    end
  end
end
