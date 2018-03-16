require 'test_helper'

class PersonTest < ActiveSupport::TestCase

  test "can create without team" do
    assert_difference('Person.count') do
      Person.create(name: "I ride in a pack of one")
    end
  end
end
