require "application_system_test_case"

class ShiftBreaksTest < ApplicationSystemTestCase
  setup do
    @shift_break = shift_breaks(:one)
  end

  test "visiting the index" do
    visit shift_breaks_url
    assert_selector "h1", text: "Shift Breaks"
  end

  test "creating a Shift break" do
    visit shift_breaks_url
    click_on "New Shift Break"

    fill_in "Break length", with: @shift_break.break_length
    fill_in "Shift", with: @shift_break.shift_id
    click_on "Create Shift break"

    assert_text "Shift break was successfully created"
    click_on "Back"
  end

  test "updating a Shift break" do
    visit shift_breaks_url
    click_on "Edit", match: :first

    fill_in "Break length", with: @shift_break.break_length
    fill_in "Shift", with: @shift_break.shift_id
    click_on "Update Shift break"

    assert_text "Shift break was successfully updated"
    click_on "Back"
  end

  test "destroying a Shift break" do
    visit shift_breaks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Shift break was successfully destroyed"
  end
end
