require 'test_helper'

class ShiftTest < ActiveSupport::TestCase
  test "Should not save without user assigned" do
    shift = Shift.new(start: DateTime.now, finish: DateTime.now, break_length: 25)
    assert_not shift.save, "Saved shift without user"
  end

  test "Should not save without start date" do
    shift = Shift.new(user_id: 1,  finish: DateTime.now, break_length: 25)
    assert_not shift.save, "Saved shift without start date"
  end

  test "Should not save without finish date" do
    shift = Shift.new(user_id: 1,  start: DateTime.now, break_length: 25)
    assert_not shift.save, "Saved shift without finish date"
  end


  test "Should save without break_length" do
    shift = Shift.new(user_id: 1,  start: DateTime.now, finish: DateTime.now)
    assert shift.save, "Not saving without break_length"
  end
end
