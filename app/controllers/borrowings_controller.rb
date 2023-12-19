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
    @borrowables = @borrowing.borrowables
    borrowable = @borrowables.where(book_id: @book.id).first_or_initialize


    if borrowable.new_record?
      @book.decrement_copies!
      borrowable.save!

      @books = Book.available

      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.replace('borrowing',
              partial: 'borrowings/borrowing',
              locals: { borrowing: @borrowing }
            ),
            turbo_stream.replace(@book),
            turbo_stream.replace('oelo', partial: 'books/books', locals: { books: @books })
          ] # ToDo: View add.turbo_stream.erb
        end
      end
    else
      @books = Book.available

      respond_to do |format|
        format.turbo_stream do
          flash.now[:notice] = "Testing!!!!!!!!!"
          render turbo_stream: [
            turbo_stream.replace('oelo', partial: 'books/books', locals: { books: @books }),
            turbo_stream.replace("flash", partial: "layouts/flash")
          ]
        end
      end
    end
  end

  def remove
    borrowable = Borrowable.find_by(id: params[:id])
    @book = borrowable.book
    @book.increment_copies!
    borrowable.destroy
    @books = Book.available

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.replace('borrowing',
            partial: 'borrowings/borrowing',
            locals: { borrowing: @borrowing }
          ),
          turbo_stream.replace(@book),
          turbo_stream.replace('oelo', partial: 'books/books', locals: { books: @books })
        ]
      end
    end
  end

  def checkout
    @borrowing.set_due_date!
    session[:borrowing_id] = nil

    respond_to do |format|
      format.html { redirect_to books_url, notice: "Books were successfully borrowed." }
    end
  end
end
