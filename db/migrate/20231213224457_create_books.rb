class CreateBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.string :author
      t.string :genre
      t.string :isbn, null: false, index: { unique: true }
      t.integer :total_copies

      t.timestamps
    end
  end
end
