class Shift < ApplicationRecord
  belongs_to :user
  has_many :shift_breaks, dependent: :destroy
  attr_reader :breaks_attributes
  accepts_nested_attributes_for :shift_breaks
  
  validates :user, :start, :finish, presence: true
  
  #validates that start time is before finish time of the shift
  validates_datetime :finish, after: :start


  def self.sort_by_name(shifts)
    shifts.sort_by{|shift| shift.user.name}
  end


  def self.search_by_shifts_user_name(shifts, search_input)
    shifts.select {|shift| shift.user.name.downcase.include? search_input}
  end

  def self.initial_shift_fetch(current_user)
    Shift.all.order(created_at: :desc).select {|shift| shift.user.organization == current_user.organization}
  end
  
end
