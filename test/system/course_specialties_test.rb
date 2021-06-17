require "application_system_test_case"

class CourseSpecialtiesTest < ApplicationSystemTestCase
  setup do
    @course_specialty = course_specialties(:one)
  end

  test "visiting the index" do
    visit course_specialties_url
    assert_selector "h1", text: "Course Specialties"
  end

  test "creating a Course specialty" do
    visit course_specialties_url
    click_on "New Course Specialty"

    fill_in "Course", with: @course_specialty.course_id
    fill_in "Specialty", with: @course_specialty.specialty_id
    click_on "Create Course specialty"

    assert_text "Course specialty was successfully created"
    click_on "Back"
  end

  test "updating a Course specialty" do
    visit course_specialties_url
    click_on "Edit", match: :first

    fill_in "Course", with: @course_specialty.course_id
    fill_in "Specialty", with: @course_specialty.specialty_id
    click_on "Update Course specialty"

    assert_text "Course specialty was successfully updated"
    click_on "Back"
  end

  test "destroying a Course specialty" do
    visit course_specialties_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Course specialty was successfully destroyed"
  end
end
