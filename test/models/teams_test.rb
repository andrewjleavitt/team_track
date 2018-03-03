require 'test_helper'

class TeamsTest < ActiveSupport::TestCase
  test"#unique" do
    expected_results = [plans(:one), plans(:two), plans(:three)].pluck(:team)

    assert_equal(expected_results.to_ary.sort, Teams.unique.sort )
  end
end
