class User < ApplicationRecord
  belongs_to :organization, optional: true
  has_many :shifts, dependent: :destroy
  has_many :breaks, through: :shifts

  validates :name, presence: true



  #Validations for password and check if email is already present are done by: :database_authenticatable, and 
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        
end
