module ShiftsHelper
require 'byebug'
#display only shifts related to current organization that user is in
  def sanitize_shifts(shifts)
    shifts.select {|shift| shift.user.organization == current_user.organization}
  end

  def convert_time(time)
    time.strftime("%m/%d/%Y" + " at %I:%M%p")
  end

  def hours(start, finish, break_length)
    time_in_minutes = (((finish - start) - (break_length * 60))) / 60
    return hours = (time_in_minutes / 60).to_i
  end

  def minutes(start, finish, break_length)
    time_in_minutes = (((finish - start) - (break_length * 60))) / 60
    minutes = (time_in_minutes % 60).to_i
  end

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
end
