require 'test_helper'

class TeamTest < ActiveSupport::TestCase

  test "#active_assignments" do
    team = create(:team)

    active_assignment = create(
      :assignment,
      person: create(:person),
      team: team,
      effective_date: 1.day.ago,
    )

    inactive_assignment = create(
      :assignment,
      person: create(:person),
      team: team,
      effective_date: 1.day.from_now,
    )

    assert_includes team.active_assignments, active_assignment
    refute_includes team.active_assignments, inactive_assignment
  end
end
