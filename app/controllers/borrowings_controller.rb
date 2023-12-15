class BorrowingsController < ApplicationController
  before_action :authenticate_user!
  before_action :init_borrowing_cart

  def init_borrowing_cart
    @borrowing ||= current_user.borrowings.find_by(id: session[:borrowing_id])

    if @borrowing.nil?
      @borrowing = current_user.borrowings.create(status: 0)
      session[:borrowing_id] = @borrowing.id
    end
  end

  def show
    @render_borrowing = false
    @borrowing = Borrowing.find_by(id: params[:id])
  end

  def return
    @borrowing = Borrowing.find_by(id: params[:id])
    @borrowing.returned_at = Time.zone.now
    @borrowing.status = 2
    @borrowing.save

    redirect_to borrowing_url(@borrowing), notice: "Books successfully returned."
  end

  def index
    @book = Book.find_by(id: params[:book_id])
    @borrowings = @book.borrowings.includes(:user)
  end

  def add
    @book = Book.find_by(id: params[:id])
    @borrowing.borrowables.create(book: @book)

    if @book.total_copies > 0
      @book.decrement!(:total_copies, 1)

      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.replace('borrowing',
              partial: 'borrowings/borrowing',
              locals: { borrowing: @borrowing }
            ),
            turbo_stream.replace(@book)
          ]
        end
      end
    end
  end

  def remove
    borrowable = Borrowable.find_by(id: params[:id])
    @book = borrowable.book
    @book.increment!(:total_copies, 1)
    borrowable.destroy

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.replace('borrowing',
            partial: 'borrowings/borrowing',
            locals: { borrowing: @borrowing }
          ),
          turbo_stream.replace(@book)
        ]
      end
    end
  end

  def checkout
    @borrowing.borrowed_at = Time.zone.now
    @borrowing.due_at = Time.zone.now + 2.weeks
    @borrowing.status = 1
    @borrowing.save!

    session[:borrowing_id] = nil

    flash.now[:notice] = "Books were succesfully borrowed."
    redirect_to books_url
  end
end
