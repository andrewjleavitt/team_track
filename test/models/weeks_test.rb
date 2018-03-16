require 'test_helper'

class WeeksTest < ActiveSupport::TestCase
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
    assert_equal(Weeks.weeks, actual_weeks)
  end
end