require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  test "#current_assignments returns the current assignme when team is set" do
    person = create(:person)
    assignment = create(:assignment, team: create(:team), person: person)

    assert_equal([assignment], person.current_assignments)
  end

  test "can create without team" do
    assert_difference('Person.count') do
      Person.create(name: "I ride in a pack of one")
    end
  end
end
