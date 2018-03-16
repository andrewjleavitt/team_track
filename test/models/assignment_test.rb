require 'test_helper'

class AssignmentTest < ActiveSupport::TestCase
  test "#active_assignments_for" do
    assigned_person = create(:person)
    unassigned_person = create(:person)
    team = create(:team)

    expected_assignment = create(
      :assignment,
      team: team,
      person: assigned_person,
      effective_date: (Date.today.beginning_of_week - 1.week),
      completion_date: (Date.today.beginning_of_week + 2.weeks)
    )

    create(
      :assignment,
      team: team,
      person: assigned_person,
      effective_date: Date.today.beginning_of_week - 2.weeks,
      completion_date: Date.today.beginning_of_week - 1.week
    )

    create(
      :assignment,
      team: team,
      person: unassigned_person,
      effective_date: Date.today.beginning_of_week - 1.weeks,
      completion_date: Date.today.beginning_of_week + 2.week
    )

    assert_equal([expected_assignment], Assignment.active_assignment_for(assigned_person))
  end
end
