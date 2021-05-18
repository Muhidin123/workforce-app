require "application_system_test_case"

class OrganizationsTest < ApplicationSystemTestCase
  setup do
    @organization = organizations(:one)

    login_as(users(:one), :scope => :user)
  end


  test "creating a new organization" do
    visit organizations_path

    click_on "Create and join new organization"

    fill_in "Name", with: "Test org"
    fill_in "Hourly rate", with: 10

    click_on "Create Organization"

    assert_text "Test org"
  end


  test "Joining an existing organization" do
    visit organizations_path

    page.first(:link, "Join").click

    assert_text "OrganizationTwo"
  end

end
