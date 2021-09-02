require "test_helper"

class AllocationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @allocation = allocations(:one)
    get '/admins/sign_in'
    sign_in admins(:admin_001)
    post admin_session_url
  end

  test "should get index" do
    get allocations_url
    assert_response :success
  end

  test "should get new" do
    get new_allocation_url
    assert_response :success
  end

  test "should create allocation" do
    assert_difference('Allocation.count') do
      post allocations_url, params: { allocation: {hospital_id: 1, specialty_id: 1, available_slots: 10, used_slots: 5, start_date: "2021-08-25", end_date: "2021-09-25" }}
    end

    assert_redirected_to allocation_url(Allocation.last)
  end

  test "should show allocation" do
    get allocation_url(@allocation)
    assert_response :success
  end

  test "should get edit" do
    get edit_allocation_url(@allocation)
    assert_response :success
  end

  test "should update allocation" do
    patch allocation_url(@allocation), params: { allocation: {specialty_id: 1, hospital_id: 1, available_slots: 10, used_slots: 5, start_date: "2021-08-25", end_date: "2021-09-25"  } }
    assert_redirected_to allocation_url(@allocation)
  end

  test "should destroy allocation" do
    assert_difference('Allocation.count', -1) do
      delete allocation_url(@allocation)
    end

    assert_redirected_to allocations_url
  end
end
