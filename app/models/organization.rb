class Organization < ApplicationRecord
    has_many :users
    has_many :shifts, through: :users

    validates :name, :hourly_rate, presence: true
    validates :name, uniqueness: true

    #will stop the user of submitting value less than one
    validates :hourly_rate, numericality: {greater_than: 0}
end
