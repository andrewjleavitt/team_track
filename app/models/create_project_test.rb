require "test_helper"

class CreateProjectTest < ActiveSupport::TestCase
  test "creates a project from attributes" do
    project_attributes = attributes_for(:project)

    assert_difference("Project.count") do
      CreateProject.new(project_attributes)
    end
  end
end