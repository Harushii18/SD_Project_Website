require "application_system_test_case"

class AllocationsTest < ApplicationSystemTestCase
  setup do
    @allocation = allocations(:one)
  end

  test "visiting the index" do
    visit allocations_url
    assert_selector "h1", text: "Allocations"
  end

  test "creating a Allocation" do
    visit allocations_url
    click_on "New Allocation"

    fill_in "Available slots", with: @allocation.available_slots
    fill_in "End date", with: @allocation.end_date
    fill_in "Hospital", with: @allocation.hospital_id
    fill_in "Specialty", with: @allocation.specialty_id
    fill_in "Start date", with: @allocation.start_date
    fill_in "Used slots", with: @allocation.used_slots
    click_on "Create Allocation"

    assert_text "Allocation was successfully created"
    click_on "Back"
  end

  test "updating a Allocation" do
    visit allocations_url
    click_on "Edit", match: :first

    fill_in "Available slots", with: @allocation.available_slots
    fill_in "End date", with: @allocation.end_date
    fill_in "Hospital", with: @allocation.hospital_id
    fill_in "Specialty", with: @allocation.specialty_id
    fill_in "Start date", with: @allocation.start_date
    fill_in "Used slots", with: @allocation.used_slots
    click_on "Update Allocation"

    assert_text "Allocation was successfully updated"
    click_on "Back"
  end

  test "destroying a Allocation" do
    visit allocations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Allocation was successfully destroyed"
  end
end
