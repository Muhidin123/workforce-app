require "application_system_test_case"

class BreaksTest < ApplicationSystemTestCase
  setup do
    @break = breaks(:one)
  end

  test "visiting the index" do
    visit breaks_url
    assert_selector "h1", text: "Breaks"
  end

  test "creating a Break" do
    visit breaks_url
    click_on "New Break"

    click_on "Create Break"

    assert_text "Break was successfully created"
    click_on "Back"
  end

  test "updating a Break" do
    visit breaks_url
    click_on "Edit", match: :first

    click_on "Update Break"

    assert_text "Break was successfully updated"
    click_on "Back"
  end

  test "destroying a Break" do
    visit breaks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Break was successfully destroyed"
  end
end
