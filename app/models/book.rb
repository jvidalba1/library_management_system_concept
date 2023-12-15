class Book < ApplicationRecord

  has_many :borrowables
  has_many :borrowings, through: :borrowables

  validates_presence_of :title, :isbn
  # validates :total_copies, numericality: { greater_than_or_equal_to: 0 }

end
