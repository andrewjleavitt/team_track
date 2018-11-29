require "test_helper"

class WeekTest < ActiveSupport::TestCase
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
    assert_equal(Week.weeks, actual_weeks)
  end

  test "#current" do
    expected_week = Date.today.beginning_of_week
    assert_equal(expected_week, Week.current)
  end

  test "#for_date returns a week for a date" do
    week_for_date = Week.for_date("2018-01-03")
    expected_week = Week.new(Date.parse("2018-01-01"))
    assert_equal(expected_week.display, week_for_date.display)
  end

  test "#start" do
    date_in_week = Date.parse("2018-01-03")
    date_start_week = Date.parse("2018-01-01")

    assert_equal(date_start_week, Week.new(date_in_week).start)
  end

  test "end" do
    date_in_week = Date.parse("2018-07-03")
    date_end_week = Date.parse("2018-07-08")

    assert_equal(date_end_week, Week.new(date_in_week).end)
  end
end
