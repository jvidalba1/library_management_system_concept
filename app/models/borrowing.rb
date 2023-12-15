class Borrowing < ApplicationRecord

  has_many :borrowables
  has_many :books, through: :borrowables
  belongs_to :user

  enum status: {
    cart: 0,
    borrowed: 1,
    returned: 2,
    overdue: 3
  }
end
