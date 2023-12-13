class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :type, inclusion: { in: ['Librarian', 'Member'], message: "%{value} is not a valid type" }

  has_many :borrowings
end
