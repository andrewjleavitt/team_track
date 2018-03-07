require 'test_helper'

class PlanTest < ActiveSupport::TestCase
  test "#weeks" do
    actual_weeks = [
      Date.today.beginning_of_week - 2.weeks,
      Date.today.beginning_of_week - 1.week,
      Date.today.beginning_of_week,
      Date.today.beginning_of_week + 1.week,
      Date.today.beginning_of_week + 2.weeks,
      Date.today.beginning_of_week + 3.weeks,
      Date.today.beginning_of_week + 4.weeks,
    ]
    assert_equal(
      Plan.weeks,
      actual_weeks
    )
  end

  test "#current_plan" do
    plan_a = create(:plan)
    plan_b = create(:plan)

    assert_equal(2, Plan.current_plan.length)
    expected_results = [plan_a, plan_b]
    assert_equal(expected_results.to_ary.sort, Plan.current_plan.to_ary.sort)
  end
end
