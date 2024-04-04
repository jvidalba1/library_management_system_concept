class CreateLibrarianDashboard
  attr_accessor :initial_scope

  def initialize(initial_scope)
    @initial_scope = initial_scope
  end

  def call
    {
      total_books: @initial_scope.count,
      borrowed_books: borrowed_books,
      books_due_today: books_due_today,
      users_overdue: users_overdue
    }
  end

  private

  def borrowed_books
    @borrowed_books ||= @initial_scope.includes(:borrowings).where(borrowings: { status: 1 })
  end

  def books_due_today
    borrowed_books.where(borrowings: { due_at: Time.current.beginning_of_day..Time.current.end_of_day})
  end

  def users_overdue
    User.includes(:borrowings).where(borrowings: { status: 3 })
  end
end
