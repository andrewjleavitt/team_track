require "test_helper"

class ProjectCategoryTest < ActiveSupport::TestCase
  test "can save with a name" do
    name = "Revenge Movies"
    project_category = ProjectCategory.new
    project_category.name = name
    assert_equal(name, project_category.name)
  end

  test "#total_cost" do
    category = build(:project_category, name: "My Project Category")
    create(:project, cost: 5, project_category: category)
    create(:project, cost: 5, project_category: category)
    create(:project, cost: 5, project_category: category)

    assert_equal(15, category.total_cost)
  end
end
