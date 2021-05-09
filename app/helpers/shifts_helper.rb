module ShiftsHelper

#display only shifts related to current organization that user is in
#same code is placed in Shifts controller but it is possible to do it this way also

  # def sanitize_shifts(shifts)
  #   shifts.select {|shift| shift.user.organization == current_user.organization}
  # end


  #displays time in a user friendly manner, if need be easy to change format of date displayed to user
  def convert_time(time)
    time.strftime("%m/%d/%Y" + " at %I:%M%p")
  end


  #total hours worked
  def hours(shift_start, shift_finish, break_length)
    time_in_minutes = (((shift_finish - shift_start) - (break_length * 60))) / 60
    return hours = (time_in_minutes / 60).to_i
  end

  
  #total minutes worked
  def minutes(shift_start, shift_finish, break_length)
    time_in_minutes = (((shift_finish - shift_start) - (break_length * 60))) / 60
    minutes = (time_in_minutes % 60).to_i
  end

  #calculate total hours worked with two helper methods
  def total_hours_worked(start, finish, break_length)
    return "#{hours(start, finish, break_length)}h - #{minutes(start,finish,break_length)}m"
  end

  def shift_cost(shift_start, shift_finish, break_length)
    hours = (hours(shift_start, shift_finish, break_length))
    minutes = ((minutes(shift_start, shift_finish, break_length).to_f))
    rate = (current_user.organization.hourly_rate).to_f
    cost = hours * rate + (minutes * (rate / 60))
    return cost.round(2)
  end
  
  def all_breaks_of_one_user_in_a_shift(breaks)
    sum = 0
    breaks.each do |shift_break|
      sum+= shift_break.break_length
    end
    sum
  end


end
