require 'application_system_test_case'

class MembersTest < ApplicationSystemTestCase

  setup do
    @team = create(:team)
    @member = build(:member)
  end

  test 'visiting the index' do
    create(:member, name: "Gentleman Steve")
    visit members_url

    assert_selector 'h1', text: 'Members'
    assert_text "Gentleman Steve"
  end

  test 'creating a member' do
    visit members_url
    click_on 'New Member'
    fill_in 'Name', with: @member.name
    select @team.name, from: 'member[team]'
    click_on 'Save'
    assert_text @member.name
    assert_text @team.name
  end

  test 'editing a member' do
    create(:member)
    visit members_url
    click_on @member.name
    click_on 'Edit'
    fill_in 'Name', with: 'Ben Kenobi'
    select @team.name, from: 'member[team]'
    click_on 'Save'
    assert_text 'Ben Kenobi'
    assert_text @team.name
  end
end
