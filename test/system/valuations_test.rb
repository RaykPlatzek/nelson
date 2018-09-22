require "application_system_test_case"

class ValuationsTest < ApplicationSystemTestCase
  setup do
    @valuation = valuations(:one)
  end

  test "visiting the index" do
    visit valuations_url
    assert_selector "h1", text: "Valuations"
  end

  test "creating a Valuation" do
    visit valuations_url
    click_on "New Valuation"

    click_on "Create Valuation"

    assert_text "Valuation was successfully created"
    click_on "Back"
  end

  test "updating a Valuation" do
    visit valuations_url
    click_on "Edit", match: :first

    click_on "Update Valuation"

    assert_text "Valuation was successfully updated"
    click_on "Back"
  end

  test "destroying a Valuation" do
    visit valuations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Valuation was successfully destroyed"
  end
end
