class Book < ApplicationRecord

  validates_presence_of :title, :isbn
  validates :total_copies, numericality: true
end
