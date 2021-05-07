class Shift < ApplicationRecord
  belongs_to :user
  has_many :breaks

  validates :user, :start, :finish, presence: true
  #validates that start time is before finish time of the shift
  validates_datetime :finish, after: :start
end
