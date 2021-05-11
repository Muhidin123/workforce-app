class Shift < ApplicationRecord
  belongs_to :user
  has_many :shift_breaks, dependent: :destroy

  #accepts nested attribute of a shift_break to create both shift and a shift break under the same form
  attr_reader :breaks_attributes
  accepts_nested_attributes_for :shift_breaks
  
  #validates presence of attributes
  validates :user, presence: true
  validates :start, presence: true
  validates :finish, presence: true

  
  #validates that start time is before finish time of the shift
  validates_datetime :finish, after: :start



  #sorts shift based on users name
  def self.sort_by_name(shifts)
    shifts.sort_by{|shift| shift.user.name}
  end



  #searches for user based on their full name or a partial match
  def self.search_by_shifts_user_name(shifts, search_input)
    shifts.select {|shift| shift.user.name.downcase.include? search_input}
  end

  #first fetch to all shifts that match current users organization
  #in the future when -> user has_and_belongs_to_many :organizations this will have to change
  def self.initial_shift_fetch(current_user)
    Shift.all.order(created_at: :desc).select {|shift| shift.user.organization == current_user.organization}
  end

  
end
