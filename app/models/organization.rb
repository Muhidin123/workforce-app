class Organization < ApplicationRecord
    # has_many :users
    has_many :user_organizations
    has_many :users, through: :user_organizations
    
    has_many :organization_shifts
    has_many :shifts, through: :organization_shifts

    validates :name, :hourly_rate, presence: true

    #will stop the user of submitting value less than one
    validates :hourly_rate, numericality: {greater_than: 0}
end
