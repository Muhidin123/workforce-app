module ShiftsHelper

  #displays time in a user friendly manner, if need be easy to change format of date displayed to user
  def convert_time(time)
    time.strftime("%m/%d/%Y" + " at %I:%M%p")
  end

  #calculate total time worked in minutes(it is easier to manipulate time later when in minutes)
  def time_in_minutes(shift_finish, shift_start, break_length)
    time_in_minutes = (((shift_finish - shift_start) - (break_length * 60))) / 60
  end

  #total hours worked
  def hours(shift_start, shift_finish, break_length)
    return (time_in_minutes(shift_finish, shift_start, break_length) / 60).to_i
  end

  
  #total minutes worked
  def minutes(shift_start, shift_finish, break_length)
    return (time_in_minutes(shift_finish, shift_start, break_length) % 60).to_i
  end

  #calculate total hours worked with two helper methods -> we do this 
  def total_hours_worked(start, finish, break_length)
    return "#{hours(start, finish, break_length)}h - #{minutes(start,finish,break_length)}m"
  end

  #total shift cost
  def shift_cost(shift_start, shift_finish, break_length)
    hours = (hours(shift_start, shift_finish, break_length))
    minutes = ((minutes(shift_start, shift_finish, break_length).to_f))
    rate = (current_user.organization.hourly_rate).to_f
    cost = hours * rate + (minutes * (rate / 60))
    return cost.round(2)
  end

  
  #gets all breaks of user in a shift and calculates sum of all of them 
  def all_breaks_of_one_user_in_a_shift(breaks)
  sum = 0
    breaks.each do |shift_break|
      sum+= shift_break.break_length
    end
    sum
  end
    
end
