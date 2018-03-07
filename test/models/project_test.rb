require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  test "#status_options" do
    assert_equal(["Green", "Yellow", "Red"], Project.status_options)
  end
end
