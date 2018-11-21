require "test_helper"

class PersonTest < ActiveSupport::TestCase
  test "can create without team" do
    assert_difference("Person.count") do
      Person.create(name: "I ride in a pack of one")
    end
  end

  test "#active_assignments" do
    person = create(:person)

    active_assignment = create(
      :assignment,
      person: person,
      team: create(:team),
      effective_date: 1.day.ago,
    )

    inactive_assignment = create(
      :assignment,
      person: person,
      team: create(:team),
      effective_date: 1.day.from_now,
    )

    assert_includes person.active_assignments, active_assignment
    refute_includes person.active_assignments, inactive_assignment
  end

  test "#assign_to assigns a person to a team" do
    team = create(:team)
    person = create(:person)

    person.assign_to team

    assert_includes person.teams, team
  end
end
