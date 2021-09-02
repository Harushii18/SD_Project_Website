require "test_helper"

class SiteFacilitatorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @site_facilitator = site_facilitators(:one)
    get '/admins/sign_in'
    sign_in admins(:admin_001)
    post admin_session_url
  end

  test "should get index" do
    get site_facilitators_url
    assert_response :success
  end

  test "should get new" do
    get new_site_facilitator_url
    assert_response :success
  end

  test "should create site_facilitator" do
    assert_difference('SiteFacilitator.count') do
      post site_facilitators_url, params: { site_facilitator: { Site_Facilitator_ContactNo: "0843746253", Site_Facilitator_Email: "John@gmail.com", Site_Facilitator_Name: "John" } }
    end

    assert_redirected_to site_facilitator_url(SiteFacilitator.last)
  end

  test "should show site_facilitator" do
    get site_facilitator_url(@site_facilitator)
    assert_response :success
  end

  test "should get edit" do
    get edit_site_facilitator_url(@site_facilitator)
    assert_response :success
  end

  test "should update site_facilitator" do
    patch site_facilitator_url(@site_facilitator), params: { site_facilitator: { Site_Facilitator_ContactNo: "0843746253", Site_Facilitator_Email: "John@gmail.com", Site_Facilitator_Name: "John" } }
    assert_redirected_to site_facilitator_url(@site_facilitator)
  end

  test "should destroy site_facilitator" do
    assert_difference('SiteFacilitator.count', -1) do
      delete site_facilitator_url(@site_facilitator)
    end

    assert_redirected_to site_facilitators_url
  end
end
