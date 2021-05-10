class ShiftBreak < ApplicationRecord
  belongs_to :shift

  validates :break_length, presence: true
  validates :break_length, break_length_less: true


end