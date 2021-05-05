require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "should not save user without name" do
    user = User.new(email: "email@gmail.com", password: "123456")
    assert_not user.save
  end


  test "should save user when all attributes present" do
    user = User.new(email: "user@gmail.com", password: "123456", name: "Test User")
    assert user.save
  end


  test "should encrypt user password" do
    password = "123456"
    user = User.new(email: "user@gmail.com", password: password, name: "Test User")
    user.save
    assert_not_equal(user.encrypted_password, "123456", ["Password Not Encrypted"])
  end


end
