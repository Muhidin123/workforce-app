class ShiftBreak < ApplicationRecord
  belongs_to :shift

  validates :break_length, presence: true


  def self.all_breaks_of_one_user_in_a_shift(shift_break)
    sum = 0
    shift_break.shift.shift_breaks.each do |single_break|
      sum+= single_break.break_length
    end
    sum
  end


  def self.hours_total?(shift_break, break_length)
    start = shift_break.shift.start
    finish = shift_break.shift.finish

    time_in_minutes = (((finish - start) - (break_length * 60))) / 60
    return self.all_breaks_of_one_user_in_a_shift(shift_break) + break_length.to_i < time_in_minutes
  end
  

end