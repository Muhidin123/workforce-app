require "test_helper"

class ShiftBreaksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shift_break = shift_breaks(:one)
  end

  test "should get index" do
    get shift_breaks_url
    assert_response :success
  end

  test "should get new" do
    get new_shift_break_url
    assert_response :success
  end

  test "should create shift_break" do
    assert_difference('ShiftBreak.count') do
      post shift_breaks_url, params: { shift_break: { break_length: @shift_break.break_length, shift_id: @shift_break.shift_id } }
    end

    assert_redirected_to shift_break_url(ShiftBreak.last)
  end

  test "should show shift_break" do
    get shift_break_url(@shift_break)
    assert_response :success
  end

  test "should get edit" do
    get edit_shift_break_url(@shift_break)
    assert_response :success
  end

  test "should update shift_break" do
    patch shift_break_url(@shift_break), params: { shift_break: { break_length: @shift_break.break_length, shift_id: @shift_break.shift_id } }
    assert_redirected_to shift_break_url(@shift_break)
  end

  test "should destroy shift_break" do
    assert_difference('ShiftBreak.count', -1) do
      delete shift_break_url(@shift_break)
    end

    assert_redirected_to shift_breaks_url
  end
end
