require "test_helper"

class ProjectCategoryTest < ActiveSupport::TestCase
  test "can save with a name" do
    name = "Revenge Movies"
    project_category = ProjectCategory.new
    project_category.name = name
    assert_equal(name, project_category.name)
  end
end
