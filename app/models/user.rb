class User < ApplicationRecord
  belongs_to :organization, optional: true
  has_many :shifts, dependent: :destroy
  validates :name, presence: true

  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        
end
