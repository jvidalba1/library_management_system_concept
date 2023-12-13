class Book < ApplicationRecord

  validates_presence_of :title, :isbn
end
