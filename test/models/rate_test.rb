require 'test_helper'

class RateTest < ActiveSupport::TestCase
  test "#weekly" do
    assert_equal(2_000, Rate.weekly)
  end
end
