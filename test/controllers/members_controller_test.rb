require 'test_helper'

class MembersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @member = members(:one)
  end

  test "should get index" do
    get members_url
    assert_response :success
  end

  test "should get new" do
    get new_member_url
    assert_response :success
  end

  test "should create member" do
    assert_difference('Member.count') do
      post members_url, params: { member: { name: 'Joe Cool'} }
    end

    assert_redirected_to members_path
  end

  test "should show member" do
    get member_url(@member)
    assert_response :success
  end

  test "should get edit" do

    get edit_member_url(@member)
    assert_response :success
  end

  test "should update member" do
    patch member_url(@member), params: { member: { name: 'Updated Name' } }
    assert_redirected_to member_url(@member)
  end
end
