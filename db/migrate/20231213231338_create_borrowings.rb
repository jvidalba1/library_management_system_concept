class CreateBorrowings < ActiveRecord::Migration[7.1]
  def change
    create_table :borrowings do |t|
      t.integer :status, default: 0
      t.datetime :returned_at
      t.datetime :due_at
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
