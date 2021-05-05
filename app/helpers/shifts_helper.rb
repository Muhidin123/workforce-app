module ShiftsHelper

#display only shifts related to current organization that user is in
  def sanitize_shifts(shifts)
    shifts.select {|shift| shift.user.organization == current_user.organization}
  end

  def convert_time(time)
    time.strftime("%m/%d/%Y" + " at %I:%M%p")
  end
  
end
