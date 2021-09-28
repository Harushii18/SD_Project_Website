require "test_helper"

class CourseDashboardControllerTest < ActionDispatch::IntegrationTest
   test "the truth" do
     assert true
   end

  test "should get index" do
    get course_dashboard_index_url
    assert_response :success
  end
end
