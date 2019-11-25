require "test_helper"

class ImportTasksTest < ActiveSupport::TestCase

  def before_alli
    Rake::Task.load_tasks
  end

  test "import teams" do
    assert_difference("Team.count", 9) do
      Rake::Task['import:teams'].invoke file_fixture('teams_log.csv')
    end
  end

  test "import people" do
    assert_difference("Person.count", 32) do
      Rake::Task['import:people'].invoke file_fixture("teams_log.csv")
    end
  end

  test "import projects" do
    assert_difference("Project.count", 26) do
      Rake::Task['import:projects'].invoke file_fixture("tracks_log.csv")
    end
  end
end
