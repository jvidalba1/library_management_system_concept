class Book < ApplicationRecord

  has_many :borrowables
  has_many :borrowings, through: :borrowables

  scope :available, -> { where(status: true) }

  validates_presence_of :title, :isbn
  validates :total_copies, numericality: { greater_than_or_equal_to: 0 }

  def decrement_copies!
    update_column(:status, false) if total_copies == 1

    decrement!(:total_copies, 1)
  end

  def increment_copies!
    update_column(:status, true) if total_copies == 0

    increment!(:total_copies, 1)
  end
end
