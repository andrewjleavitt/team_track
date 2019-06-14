require "test_helper"

class ProjectCategoryTest < ActiveSupport::TestCase
  test "can save with a name" do
    name = "Revenge Movies"
    project_category = ProjectCategory.new
    project_category.name = name
    assert_equal(name, project_category.name)
  end

  test "#total_cost" do
    team = create(:team)
    person = create(:person)
    person.assign_to(team, 6.weeks.ago.beginning_of_week)

    category = build(:project_category, name: "My Project Category")
    p1 = create(:project, project_category: category)
    p2 = create(:project, project_category: category)
    p3 = create(:project, project_category: category)

    p1.assign_to(team)
    p2.assign_to(team)
    p3.assign_to(team)

    p1.start(4.weeks.ago.beginning_of_week)
    p2.start(4.weeks.ago.beginning_of_week)
    p3.start(4.weeks.ago.beginning_of_week)


    assert_equal(30_000, category.total_cost)
  end
end
