require "test_helper"

require "test_helper"
class DashboardControllerTest < ActionDispatch::IntegrationTest
  setup do
    get '/admins/sign_in'
    sign_in admins(:admin_001)
    post admin_session_url
  end

  test "should get index" do
    get dashboard_index_url
    assert_response :success
  end
end
