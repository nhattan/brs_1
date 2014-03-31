class Admin::BooksController < ApplicationController
  before_filter :authenticate_admin!
  load_and_authorize_resource param_method: :book_params

  def create
    @book = Book.new book_params
    if @book.save
      flash[:success] = "Saved"
      redirect_to admin_book_url @book
    else
      render 'new'
    end
  end
  
  def update
    @book = Book.find params[:id]
    if @book.update_attributes book_params
      flash[:success] = "Updated"
      redirect_to admin_books_url
    else
      render 'edit'
    end
  end

  def destroy
    book = Book.find params[:id]
    book.destroy
    flash[:success] = "Deleted"
    redirect_to admin_books_url
  end

  private

    def book_params
      params.require(:book).permit(:category_id, :title, :summary,
        :page, :author, :published_at, :page)
    end
end
