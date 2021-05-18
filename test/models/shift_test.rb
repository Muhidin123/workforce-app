require 'test_helper'

class ShiftTest < ActiveSupport::TestCase
  test "Should not save without user assigned" do
    shift = Shift.new(start: DateTime.now, finish: DateTime.now)
    assert_not shift.save, "Saved shift without user"
  end

  test "Should not save without start date" do
    shift = Shift.new(user_id: users(:one).id,  finish: DateTime.now)
    assert_not shift.save, "Saved shift without start date"
  end

  test "Should not save without finish date" do
    shift = Shift.new(user_id: users(:one).id,  start: DateTime.now)
    assert_not shift.save, "Saved shift without finish date"
  end


  test "Should save without break_length" do
    shift = Shift.new(user_id: users(:one).id,  start: DateTime.now, finish: DateTime.now)
    assert shift.save, "Not saving without break_length"
  end


  test "Should not save if start date is before end date" do
    shift = Shift.new(user_id: users(:one).id,  start: (DateTime.now + 1.day), finish: DateTime.now)
    assert_not shift.save, "Saved with start date before end date"
  end


  test "should not save if form is completely empty" do
    shift = Shift.new(user_id: users(:one), start: "", finish: "")
    assert_not shift.save, "Saved with empty form"
  end

  test "should not save" do
    shift = Shift.new()
    assert_not shift.save, "Saved with empty form"
  end

end
