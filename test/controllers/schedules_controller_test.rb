require "test_helper"

class SchedulesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @schedule = schedules(:one)
    get '/admins/sign_in'
    sign_in admins(:admin_001)
    post admin_session_url
  end

  test "should get new" do
    get new_schedule_url
    assert_response :success
  end

  test "should get index" do
    get schedules_url
    assert_response :success
  end

  #test "should create schedule" do
  #  assert_difference('Schedule.count') do
  #    post schedules_url, params: {   hospital: 1, week_no: 1, specialty: 1, student: 1, specialty_duration: 1 }
  #  end

  # assert_redirected_to schedule_url(Schedule.last)
  #end

  test "should show schedule" do
    get schedule_url(@schedule)
    assert_response :success
  end

  test "should get edit" do
    get edit_schedule_url(@schedule)
    assert_response :success
  end

 # test "should update schedule" do
 #   patch schedule_url(@schedule), params: { schedule: { hospital_id: 1, rotation_id: 1, specialty_id: 1, student_id: 1 } }
 #   assert_redirected_to schedule_url(@schedule)
 # end

  test "should destroy schedule" do
    assert_difference('Schedule.count', -1) do
      delete schedule_url(@schedule)
    end

    assert_redirected_to schedules_url
  end
end
