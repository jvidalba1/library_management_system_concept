class CreateMemberDashboard
  attr_accessor :user, :initial_scope

  def initialize(user)
    @user = user
  end

  def call
    {
      user_borrowings: user_borrowings
    }
  end

  private

  def user_borrowings
    Borrowing
      .includes(:books)
      .where(borrowings: { user_id: @user.id, status: [1,2,3]} )
  end
end
