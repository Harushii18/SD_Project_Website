require "test_helper"

class SpecialtiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @specialty = specialties(:one)
    get '/admins/sign_in'
    sign_in admins(:admin_001)
    post admin_session_url
  end

  test "should get new" do
    get new_specialty_url
    assert_response :success
  end

  test "should create specialty" do
    assert_difference('Specialty.count') do
      post specialties_url, params: { specialty: { SpecialtyName: @specialty.SpecialtyName } }
    end

    assert_redirected_to specialty_url(Specialty.last)
  end

  test "should show specialty" do
    get specialty_url(@specialty)
    assert_response :success
  end

  test "should get edit" do
    get edit_specialty_url(@specialty)
    assert_response :success
  end

  test "should update specialty" do
    patch specialty_url(@specialty), params: { specialty: { SpecialtyName: @specialty.SpecialtyName } }
    assert_redirected_to specialty_url(@specialty)
  end

end
