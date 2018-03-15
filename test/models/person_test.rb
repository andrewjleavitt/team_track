require 'test_helper'

class PeopleTest < ActiveSupport::TestCase
  test "#current_team returns the current team when team is set" do
    team = create(:team)
    person = create(:person, team_id: team.id)

    assert_equal(team, person.current_team)
  end

  test "can create without team" do
    assert_difference('Person.count') do
      Person.create(name: "I ride in a pack of one")
    end
  end
end
