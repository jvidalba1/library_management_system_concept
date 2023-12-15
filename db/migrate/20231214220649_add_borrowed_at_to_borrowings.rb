class AddBorrowedAtToBorrowings < ActiveRecord::Migration[7.1]
  def change
    add_column :borrowings, :borrowed_at, :datetime
  end
end
