require 'byebug'

class BreakLengthLessValidator < ActiveModel::EachValidator



    def all_breaks_of_one_user_in_a_shift(shift_break)
        sum = 0
        shift_break.shift.shift_breaks.each do |single_break|
            sum+= single_break.break_length
        end
        sum
    end

    def time_in_minutes(finish, start)
        ((finish - start)) / 60
    end
    
    
    def hours_total(shift_break)
        start = shift_break.shift.start
        finish = shift_break.shift.finish
        return time_in_minutes(finish, start)
    end
      
      
    def validate_each(record, attribute, value)
        # byebug
        if  all_breaks_of_one_user_in_a_shift(record) + value > hours_total(record)
            record.errors.add(attribute, :blank, message: "can not be more than working hours total")
        else
            true
        end
    end


    
end