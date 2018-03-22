require 'test_helper'

class AssignmentTest < ActiveSupport::TestCase
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
