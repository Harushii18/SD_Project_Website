require "application_system_test_case"

class SiteFacilitatorsTest < ApplicationSystemTestCase
  setup do
    @site_facilitator = site_facilitators(:one)
  end

  test "visiting the index" do
    visit site_facilitators_url
    assert_selector "h1", text: "Site Facilitators"
  end

  test "creating a Site facilitator" do
    visit site_facilitators_url
    click_on "New Site Facilitator"

    fill_in "Site facilitator contactno", with: @site_facilitator.Site_Facilitator_ContactNo
    fill_in "Site facilitator email", with: @site_facilitator.Site_Facilitator_Email
    fill_in "Site facilitator name", with: @site_facilitator.Site_Facilitator_Name
    click_on "Create Site facilitator"

    assert_text "Site facilitator was successfully created"
    click_on "Back"
  end

  test "updating a Site facilitator" do
    visit site_facilitators_url
    click_on "Edit", match: :first

    fill_in "Site facilitator contactno", with: @site_facilitator.Site_Facilitator_ContactNo
    fill_in "Site facilitator email", with: @site_facilitator.Site_Facilitator_Email
    fill_in "Site facilitator name", with: @site_facilitator.Site_Facilitator_Name
    click_on "Update Site facilitator"

    assert_text "Site facilitator was successfully updated"
    click_on "Back"
  end

  test "destroying a Site facilitator" do
    visit site_facilitators_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Site facilitator was successfully destroyed"
  end
end
