class BooksController < ApplicationController
  load_and_authorize_resource

  def index
    @categories = Category.all
    @books = Book.search(params)
  end
end