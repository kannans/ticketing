require "application_system_test_case"

class ExcavatorsTest < ApplicationSystemTestCase
  setup do
    @excavator = excavators(:one)
  end

  test "visiting the index" do
    visit excavators_url
    assert_selector "h1", text: "Excavators"
  end

  test "creating a Excavator" do
    visit excavators_url
    click_on "New Excavator"

    fill_in "Company Name", with: @excavator.company_name
    click_on "Create Excavator"

    assert_text "Excavator was successfully created"
    click_on "Back"
  end

  test "updating a Excavator" do
    visit excavators_url
    click_on "Edit", match: :first

    fill_in "Company Name", with: @excavator.company_name
    click_on "Update Excavator"

    assert_text "Excavator was successfully updated"
    click_on "Back"
  end

  test "destroying a Excavator" do
    visit excavators_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Excavator was successfully destroyed"
  end
end
