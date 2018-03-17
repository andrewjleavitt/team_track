require 'test_helper'

class PersonTest < ActiveSupport::TestCase

  test "can create without team" do
    assert_difference('Person.count') do
      Person.create(name: "I ride in a pack of one")
    end
  end

  test "#active_assignments" do
    person = build(:person)
    Assignment.stub :active_assignment_for_person, [:assignments] do
      assert_equal [:assignments], person.active_assignments
    end
  end
end
