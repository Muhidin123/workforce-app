class Shift < ApplicationRecord
  belongs_to :user
  has_many :shift_breaks, dependent: :destroy
  attr_reader :breaks_attributes
  accepts_nested_attributes_for :shift_breaks
  
  validates :user, :start, :finish, presence: true
  
  #validates that start time is before finish time of the shift
  validates_datetime :finish, after: :start
  

  scope :by_name_dsc, -> () {order("user.name DESC")}

end
