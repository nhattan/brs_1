class UserBooksController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def create
    @book = Book.find params[:id]
    if params[:read]
      @user_book = @book.user_books.build user_id: current_user.id, read: 1 
    elsif params[:favorite]
      @user_book = @book.user_books.build user_id: current_user.id, favorite: 1
    elsif params[:request]
      @user_book = @book.user_books.build user_id: current_user.id, request: 1
    end
    if @user_book.save
      respond_to do |format|
        format.html{ redirect_to @book }
        format.js
      end
    end
  end

  def update
    @book = Book.find params[:id]
    @user_book = @book.user_books.find_by_user_id current_user.id
    if params[:read]
      @user_book.update_attributes read: params[:read]
    elsif params[:favorite]
      @user_book.update_attributes favorite: params[:favorite]
    elsif params[:request]
      @user_book.update_attributes request: params[:request]
    end
    respond_to do |format|
      format.html{ redirect_to @book }
      format.js
    end
  end
end