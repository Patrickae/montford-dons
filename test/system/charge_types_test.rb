require "application_system_test_case"

class ChargeTypesTest < ApplicationSystemTestCase
  setup do
    @charge_type = charge_types(:one)
  end

  test "visiting the index" do
    visit charge_types_url
    assert_selector "h1", text: "Charge types"
  end

  test "should create charge type" do
    visit charge_types_url
    click_on "New charge type"

    fill_in "Amount", with: @charge_type.amount
    fill_in "Frequency", with: @charge_type.frequency
    fill_in "Name", with: @charge_type.name
    click_on "Create Charge type"

    assert_text "Charge type was successfully created"
    click_on "Back"
  end

  test "should update Charge type" do
    visit charge_type_url(@charge_type)
    click_on "Edit this charge type", match: :first

    fill_in "Amount", with: @charge_type.amount
    fill_in "Frequency", with: @charge_type.frequency
    fill_in "Name", with: @charge_type.name
    click_on "Update Charge type"

    assert_text "Charge type was successfully updated"
    click_on "Back"
  end

  test "should destroy Charge type" do
    visit charge_type_url(@charge_type)
    accept_confirm { click_on "Destroy this charge type", match: :first }

    assert_text "Charge type was successfully destroyed"
  end
end
