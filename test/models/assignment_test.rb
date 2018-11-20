require 'test_helper'

class AssignmentTest < ActiveSupport::TestCase
  test "#active when given a week argument" do
    create(
      :assignment,
      team: create(:team),
      person: create(:person),
      effective_date: (1.week.ago),
      completion_date: (Date.today.beginning_of_week + 1.week)
    )

    assert_equal(0, Assignment.active(Date.today.beginning_of_week - 1.week - 1.day).count)
    assert_equal(1, Assignment.active(Date.today.beginning_of_week).count)
    assert_equal(0, Assignment.active(Date.today.beginning_of_week + 1.week).count)
  end

  test "#complete" do
    assignment = create(
      :assignment,
      team: create(:team),
      person: create(:person),
      effective_date: (1.week.ago),
      completion_date: nil
    )

    week_to_complete = Week.current - 1.week
    assignment.complete(week_to_complete)

    assert_equal(week_to_complete, assignment.completion_date)
  end
end
