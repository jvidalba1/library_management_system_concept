class Borrowable < ApplicationRecord
  belongs_to :book
  belongs_to :borrowing
end
