require "application_system_test_case"

class SiteFacilitatorAllocationsTest < ApplicationSystemTestCase
  setup do
    @site_facilitator_allocation = site_facilitator_allocations(:one)
  end

  test "visiting the index" do
    visit site_facilitator_allocations_url
    assert_selector "h1", text: "Site Facilitator Allocations"
  end

  test "creating a Site facilitator allocation" do
    visit site_facilitator_allocations_url
    click_on "New Site Facilitator Allocation"

    fill_in "Hospital", with: @site_facilitator_allocation.hospital_id
    fill_in "Site facilitator", with: @site_facilitator_allocation.site_facilitator_id
    click_on "Create Site facilitator allocation"

    assert_text "Site facilitator allocation was successfully created"
    click_on "Back"
  end

  test "updating a Site facilitator allocation" do
    visit site_facilitator_allocations_url
    click_on "Edit", match: :first

    fill_in "Hospital", with: @site_facilitator_allocation.hospital_id
    fill_in "Site facilitator", with: @site_facilitator_allocation.site_facilitator_id
    click_on "Update Site facilitator allocation"

    assert_text "Site facilitator allocation was successfully updated"
    click_on "Back"
  end

  test "destroying a Site facilitator allocation" do
    visit site_facilitator_allocations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Site facilitator allocation was successfully destroyed"
  end
end
