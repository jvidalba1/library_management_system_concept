module Api
  module V1
    class BooksController < ApiController
      def index
        @books = Book.available.paginate(page: params[:page])
      end

      def show
        @book = Book.find(params[:id])
      end

      def create

      end

      def update

      end

      def destroy

      end
    end
  end
end
