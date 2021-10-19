require "test_helper"

class CourseDashboardControllerTest < ActionDispatch::IntegrationTest
  setup do
    get '/admins/sign_in'
    sign_in admins(:admin_001)
    post admin_session_url
  end

  test "should get index" do
    get course_dashboard_index_url
    assert_response :success
  end
end
