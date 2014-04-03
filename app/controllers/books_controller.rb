class BooksController < ApplicationController
  load_and_authorize_resource

  def index
    @categories = Category.all
    @search = Book.search params[:q]
    @books = @search.result
  end

  def show
    @book = Book.find params[:id]
    @reviews = @book.reviews
    @review = Review.new
    @review.book_id = @book.id
  end
end