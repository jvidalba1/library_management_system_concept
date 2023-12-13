class BorrowingBooks < ActiveRecord::Migration[7.1]
  def change
    create_join_table :borrowings, :books do |t|
      t.index :borrowing_id
      t.index :book_id
    end
  end
end
