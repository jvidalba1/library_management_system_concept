class AddStatusToBooks < ActiveRecord::Migration[7.1]
  def change
    add_column :books, :status, :boolean, null: false, default: true
  end
end
