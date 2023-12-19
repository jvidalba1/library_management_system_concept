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

  # This could be a service object if development increases
  def set_due_date!
    self.borrowed_at = Time.zone.now
    self.due_at = Time.zone.now + expiration_time
    self.status = 1
    self.save!
  end

  private

  def expiration_time
    2.weeks
  end
end
