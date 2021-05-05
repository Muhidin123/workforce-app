class Shift < ApplicationRecord
  belongs_to :user

  validates :user, :start, :finish, presence: true
end
