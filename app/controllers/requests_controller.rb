class RequestsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def create
    @book = Book.find params[:book_id]
    @request = @book.requests.build user_id: current_user.id
    if @request.save
      respond_to do |format|
        format.html{ redirect_to @book }
        format.js
      end
    end
  end

  def destroy
    @book = Book.find params[:book_id]
    @request = Request.find params[:id]
    @request.destroy
    respond_to do |format|
      format.html{ redirect_to @book }
      format.js
    end
  end
end