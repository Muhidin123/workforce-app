require "test_helper"

class OrganizationTest < ActiveSupport::TestCase
  test "should not save organization without name" do
    org = Organization.new
    assert_not org.save, "Saved Without Name"
  end

  test "should not save organization without hourly_rate" do
    org = Organization.new(name: "organization name")
    assert_not org.save, "Saved Without hourly_rate"
  end

  
end
