class ShiftBreak < ApplicationRecord
  belongs_to :shift

  validates :break_length, presence: true

end