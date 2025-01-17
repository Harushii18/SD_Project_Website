require "test_helper"

class ProgrammesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @programme = programmes(:one)
    get '/admins/sign_in'
    sign_in admins(:admin_001)
    post admin_session_url
  end

  test "should get new" do
    get new_programme_url
    assert_response :success
  end

  test "should create programme" do
    assert_difference('Programme.count') do
      post programmes_url, params: { programme: { programme_code: @programme.programme_code } }
    end

    assert_redirected_to programme_url(Programme.last)
  end

  test "should show programme" do
    get programme_url(@programme)
    assert_response :success
  end

  test "should get edit" do
    get edit_programme_url(@programme)
    assert_response :success
  end

  test "should update programme" do
    patch programme_url(@programme), params: { programme: { programme_code: @programme.programme_code } }
    assert_redirected_to programme_url(@programme)
  end

  test "should destroy programme" do
    assert_difference('Programme.count', -1) do
      delete programme_url(@programme)
    end

    assert_redirected_to programmes_url
  end
end
