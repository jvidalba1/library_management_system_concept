json.pagination do
  json.current_page @books.current_page
  json.per_page @books.per_page
  json.total_entries @books.total_entries
end

# json.array! @books, partial: "books/book", as: :book

json.books @books do |book|
  json.extract! book, :id, :title, :author, :genre, :isbn, :created_at, :updated_at
  json.url book_url(book, format: :json)
end
