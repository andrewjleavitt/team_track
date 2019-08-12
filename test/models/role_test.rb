require "test_helper"

class RoleTest < ActiveSupport::TestCase
  test "#roles" do
    expected_roles = ["Engineer", "Product Manager", "Team Lead", "Designer", "Director", "Quality Assurance", "Technical Writing"]

    assert_equal(expected_roles, Role.roles)
  end
end
