class Borrowing < ApplicationRecord
  enum status: {
    boworred: 0,
    returned: 1,
    overdue: 2
  }

  belongs_to :user
end
