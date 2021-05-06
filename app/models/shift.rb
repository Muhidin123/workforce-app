class Shift < ApplicationRecord
  belongs_to :user

  validates :user, :start, :finish, presence: true
  # validate :end_date_is_after_start_date


  # private

  # def end_date_is_after_start_date
  #   if finish < start
  #     errors.add(:end_date, "cannot be before the start date") 
  #   end
  # end

end
