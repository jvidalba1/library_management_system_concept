class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    # ToDo Query Objects
    @books = Book.all
    @borrowed_books = Book.includes(:borrowings).where(borrowings: { status: 1 })
    @books_due_today = @borrowed_books.where(borrowings: { due_at: Time.current.beginning_of_day..Time.current.end_of_day})
    @users = User.includes(:borrowings).where(borrowings: { status: 3 })

    @member_borrowings = Borrowing.includes(:books).where(borrowings: { user_id: current_user.id, status: [1,2,3]} )
  end
end
