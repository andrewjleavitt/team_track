require 'application_system_test_case'

class MembersTest < ApplicationSystemTestCase
  member_attributes = {name: 'Bobba Fett'}
  test 'visiting the index' do
    Member.create(member_attributes)
    visit members_url

    assert_selector 'h1', text: 'Members'
    assert_text 'Bobba Fett'
  end

  test 'creating a member' do
    visit members_url
    click_on 'New Member'
    fill_in 'Name', with: 'Bobba Fett'
    click_on 'Save'
    assert_text 'Bobba Fett'
  end

  test 'editing a member' do
    Member.create(member_attributes)
    visit members_url
    click_on 'Bobba Fett'
    click_on 'Edit'
    fill_in 'Name', with: 'Ben Kenobi'
    click_on 'Save'
    assert_text 'Ben Kenobi'
  end
end
