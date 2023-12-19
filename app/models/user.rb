class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :type, inclusion: { in: ['Librarian', 'Member'], message: "%{value} is not a valid type" }

  has_many :borrowings

  def is_librarian?
    type == 'Librarian'
  end

  def is_member?
    type == 'Member'
  end
end
