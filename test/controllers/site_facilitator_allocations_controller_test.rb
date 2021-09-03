require "test_helper"

class SiteFacilitatorAllocationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @site_facilitator_allocation = site_facilitator_allocations(:one)
  end

  test "should get index" do
    get site_facilitator_allocations_url
    assert_response :success
  end

  test "should get new" do
    get new_site_facilitator_allocation_url
    assert_response :success
  end

  test "should create site_facilitator_allocation" do
    assert_difference('SiteFacilitatorAllocation.count') do
      post site_facilitator_allocations_url, params: { site_facilitator_allocation: { hospital_id: @site_facilitator_allocation.hospital_id, site_facilitator_id: @site_facilitator_allocation.site_facilitator_id } }
    end

    assert_redirected_to site_facilitator_allocation_url(SiteFacilitatorAllocation.last)
  end

  test "should show site_facilitator_allocation" do
    get site_facilitator_allocation_url(@site_facilitator_allocation)
    assert_response :success
  end

  test "should get edit" do
    get edit_site_facilitator_allocation_url(@site_facilitator_allocation)
    assert_response :success
  end

  test "should update site_facilitator_allocation" do
    patch site_facilitator_allocation_url(@site_facilitator_allocation), params: { site_facilitator_allocation: { hospital_id: @site_facilitator_allocation.hospital_id, site_facilitator_id: @site_facilitator_allocation.site_facilitator_id } }
    assert_redirected_to site_facilitator_allocation_url(@site_facilitator_allocation)
  end

  test "should destroy site_facilitator_allocation" do
    assert_difference('SiteFacilitatorAllocation.count', -1) do
      delete site_facilitator_allocation_url(@site_facilitator_allocation)
    end

    assert_redirected_to site_facilitator_allocations_url
  end
end
