require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  test "#current_team returns the current team when team is set" do
    team = create(:team)
    person = create(:person, team_id: team.id)
    assignment = create(:assignment, team: team, person: person)

    assert_equal([assignment], person.current_assignments)
  end

  test "can create without team" do
    assert_difference('Person.count') do
      Person.create(name: "I ride in a pack of one")
    end
  end
end
