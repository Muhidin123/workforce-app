class Shift < ApplicationRecord
  belongs_to :user
  has_many :shift_breaks, dependent: :destroy

  accepts_nested_attributes_for :shift_breaks
  attr_reader :breaks_attributes
  
  validates :user, :start, :finish, presence: true
  #validates that start time is before finish time of the shift
  validates_datetime :finish, after: :start
  

end
