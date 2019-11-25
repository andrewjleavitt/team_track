require "test_helper"

class CreatePersonTest < ActiveSupport::TestCase
  test "creates a person from attributes" do
    person_attributes = attributes_for(:person)

    assert_difference("Person.count") do
      CreatePerson.new(person_attributes)
    end
  end
end