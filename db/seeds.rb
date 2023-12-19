# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Borrowable.delete_all
Book.delete_all
Borrowing.delete_all
User.delete_all


librarian = Librarian.create!(email: "librarian1@sample.com", password: "librarian")
member1 = Member.create!(email: "member1@sample.com", password: "membermember")
member2 = Member.create!(email: "member2@sample.com", password: "membermember")


# books

bo1 = Book.create!(id: 1,title: Faker::Book.title,author: Faker::Book.author,genre: Faker::Book.genre,isbn: Faker::Code.isbn,total_copies: Random.rand(1..10))
bo2 = Book.create!(id: 2,title: Faker::Book.title,author: Faker::Book.author,genre: Faker::Book.genre,isbn: Faker::Code.isbn,total_copies: Random.rand(1..10))
bo3 = Book.create!(id: 3,title: Faker::Book.title,author: Faker::Book.author,genre: Faker::Book.genre,isbn: Faker::Code.isbn,total_copies: Random.rand(1..10))
bo4 = Book.create!(id: 4,title: Faker::Book.title,author: Faker::Book.author,genre: Faker::Book.genre,isbn: Faker::Code.isbn,total_copies: Random.rand(1..10))
bo5 = Book.create!(id: 5,title: Faker::Book.title,author: Faker::Book.author,genre: Faker::Book.genre,isbn: Faker::Code.isbn,total_copies: Random.rand(1..10))
bo6 = Book.create!(id: 6,title: Faker::Book.title,author: Faker::Book.author,genre: Faker::Book.genre,isbn: Faker::Code.isbn,total_copies: Random.rand(1..10))
bo7 = Book.create!(id: 7,title: Faker::Book.title,author: Faker::Book.author,genre: Faker::Book.genre,isbn: Faker::Code.isbn,total_copies: Random.rand(1..10))
bo8 = Book.create!(id: 8,title: Faker::Book.title,author: Faker::Book.author,genre: Faker::Book.genre,isbn: Faker::Code.isbn,total_copies: Random.rand(1..10))
bo9 = Book.create!(id: 9,title: Faker::Book.title,author: Faker::Book.author,genre: Faker::Book.genre,isbn: Faker::Code.isbn,total_copies: Random.rand(1..10))
bo10 = Book.create!(id: 10,title: Faker::Book.title,author: Faker::Book.author,genre: Faker::Book.genre,isbn: Faker::Code.isbn,total_copies: 10)
bo11 = Book.create!(id: 11,title: Faker::Book.title,author: Faker::Book.author,genre: Faker::Book.genre,isbn: Faker::Code.isbn,total_copies: 10)


#borrowings borrowed
b1 = Borrowing.create!(status: 1, borrowed_at: Time.zone.now, due_at: Time.zone.now + 2.weeks, user_id: member1.id)
b1.borrowables.create(book: bo1)
b1.borrowables.create(book: bo2)

b2 = Borrowing.create!(status: 1, borrowed_at: Time.zone.now - 1.week, due_at: Time.zone.now + 1.week, user_id: member1.id)
b2.borrowables.create(book: bo3)
b2.borrowables.create(book: bo4)

b3 = Borrowing.create!(status: 1, borrowed_at: Time.zone.now, due_at: Time.zone.now + 2.weeks, user_id: member1.id)
b3.borrowables.create(book: bo5)

b4 = Borrowing.create!(status: 1, borrowed_at: Time.zone.now, due_at: Time.zone.now + 2.weeks, user_id: member2.id)
b4.borrowables.create(book: bo6)
b4.borrowables.create(book: bo7)

b5 = Borrowing.create!(status: 1, borrowed_at: Time.zone.now - 2.weeks, due_at: Time.zone.now, user_id: member2.id)
b5.borrowables.create(book: bo8)
b5.borrowables.create(book: bo9)
b5.borrowables.create(book: bo10)

# borrowings returned
b6 = Borrowing.create!(status: 2, returned_at: Time.zone.now, borrowed_at: Time.zone.now - 1.week, due_at: Time.zone.now + 1.week, user_id: member1.id)
b6.borrowables.create(book: bo10)
b6.borrowables.create(book: bo9)

#borrowings overdue

b7 = Borrowing.create!(status: 3, returned_at: Time.zone.now, borrowed_at: Time.zone.now - 3.week, due_at: Time.zone.now - 1.week, user_id: member2.id)
b7.borrowables.create(book: bo1)
b7.borrowables.create(book: bo2)
