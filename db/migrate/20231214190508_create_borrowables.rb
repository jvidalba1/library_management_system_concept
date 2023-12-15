class CreateBorrowables < ActiveRecord::Migration[7.1]
  def change
    create_table :borrowables do |t|
      t.belongs_to :book, null: false, foreign_key: true
      t.belongs_to :borrowing, null: false, foreign_key: true

      t.timestamps
    end
  end
end
