require 'test_helper'

class AssignmentTest < ActiveSupport::TestCase
  test "#active_assignments_for_person" do
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

    other_expected_assignment = create(
      :assignment,
      team: team,
      person: assigned_person,
      effective_date: Date.today.beginning_of_week - 1.weeks,
      completion_date: nil
    )

    assert_equal([expected_assignment, other_expected_assignment], Assignment.active_assignment_for_person(assigned_person))
  end

  test "#active when given a week argument" do
    assignment = create(
      :assignment,
      team: create(:team),
      person: create(:person),
      effective_date: (1.week.ago),
      completion_date: (Date.today.beginning_of_week + 1.week)
    )

    assert_equal(0, Assignment.active(Date.today.beginning_of_week - 1.week).count)
    assert_equal(1, Assignment.active(Date.today.beginning_of_week).count)
    assert_equal(0, Assignment.active(Date.today.beginning_of_week + 1.week).count)
  end
end
