require "test_helper"

class ShiftsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shift = shifts(:one)
    #we can create new user or use one of the users from fixture
    # user = User.create!(:email => 'test@example.com', :password => 'f4k3p455w0rd', :name => "User")
    # login_as(user, :scope => :user)
    login_as(users(:one), :scope => :user)

  end

  test "should get new" do
    get new_shift_url
    assert_response :success
  end

  test "should create shift" do
    assert_difference('Shift.count') do
      post shifts_path, params: { shift: { break_length: @shift.break_length, finish: @shift.finish, start: @shift.start, user_id: users(:one).id }}
    end
    assert_redirected_to shifts_path
  end

  test "should show shift" do
    get shift_url(@shift)
    assert_response :success
  end

  test "should get edit" do
    get edit_shift_url(@shift)
    assert_response :success
  end

  test "should update shift" do
    patch shift_url(@shift), params: { shift: { break_length: @shift.break_length, finish: @shift.finish, start: @shift.start, user_id: users(:one).id } }
    assert_redirected_to root_path
  end

  test "should destroy shift" do
    assert_difference('Shift.count', -1) do
      delete shift_url(@shift)
    end

    assert_redirected_to shifts_url
  end
end
