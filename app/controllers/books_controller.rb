class BooksController < ApplicationController
  load_and_authorize_resource

  def index
    @categories = Category.all
    @categories.unshift(Category.new(name: "All"))
    @search = Book.search params[:q]
    @books = @search.result
  end
end