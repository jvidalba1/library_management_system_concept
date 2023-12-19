class BooksController < ApplicationController
  before_action :set_book, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  before_action :init_borrowing_cart

  def init_borrowing_cart
    @borrowing ||= current_user.borrowings.find_by(id: session[:borrowing_id])

    if @borrowing.nil?
      @borrowing = current_user.borrowings.create(status: 0)
      session[:borrowing_id] = @borrowing.id
    end
  end

  # GET /books or /books.json
  def index
    if params[:search_value].present?
      @books = Book.available
      @books = @books.where('title ilike ? OR author ilike ? OR genre ilike ?', "%#{params[:search_value]}%", "%#{params[:search_value]}%", "%#{params[:search_value]}%")
    else
      @books = Book.available
    end
  end

  # GET /books/1 or /books/1.json
  def show
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books or /books.json
  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to books_url, notice: "Book was successfully created." }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1 or /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to books_url, notice: "Book was successfully updated." }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1 or /books/1.json
  def destroy
    @book.destroy!

    respond_to do |format|
      format.html { redirect_to books_url, notice: "Book was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def book_params
      params.require(:book).permit(:title, :author, :genre, :isbn, :total_copies)
    end
end
