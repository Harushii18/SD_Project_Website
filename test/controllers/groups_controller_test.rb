require "test_helper"

class GroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @group = groups(:one)
    get '/admins/sign_in'
    sign_in admins(:admin_001)
    post admin_session_url
  end

  test "should get index" do
    get groups_url
    assert_response :success
  end

  test "should get new" do
    get new_group_url
    assert_response :success
  end

  

  test "should create group" do
    assert_difference('Group.count') do
      post groups_url, params: { group: {specialty_id: 2}}
    end

    assert_redirected_to group_url(Group.last)
  end

  test "should show group" do
    get group_url(@group)
    assert_response :success
  end

  test "should get edit" do
    get edit_group_url(@group)
    assert_response :success
  end

  test "should update group" do
    patch group_url(@group), params: { group: {specialty_id: 1, hospital_id: 1, available_slots: 10, used_slots: 5, start_date: "2021-08-25", end_date: "2021-09-25"  } }
    assert_redirected_to group_url(@group)
  end

  test "should destroy group" do
    assert_difference('Group.count', -1) do
      delete group_url(@group)
    end

    assert_redirected_to groups_url
  end
end
