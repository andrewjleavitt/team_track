require 'test_helper'

class PlanTest < ActiveSupport::TestCase
  test "#current_plan" do
    plan_a = create(:plan)
    plan_b = create(:plan)

    assert_equal(2, Plan.current_plan.length)
    expected_results = [plan_a, plan_b]
    assert_equal(expected_results.to_ary.sort, Plan.current_plan.to_ary.sort)
  end

  test "#for_week" do
    plan_a = create(:plan, week: Week.weeks[0])
    plan_b = create(:plan, week: Week.weeks[0])
    plan_c = create(:plan, week: Week.weeks[1])

    plans = Plan.for_week(Week.weeks[0])
    assert_equal([plan_a, plan_b], plans)
  end
end
