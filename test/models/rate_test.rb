require 'test_helper'

class RateTest < ActiveSupport::TestCase
  test "#amount" do
    assert_equal(100_000, Rate.amount)
  end
end
