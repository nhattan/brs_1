class Admin::RequestsController < ApplicationController
  before_filter :authenticate_admin!
  load_and_authorize_resource

  def update
    @book = Book.find params[:book_id]
    @request = Request.find params[:id]
    if params[:accept]
      @request.update_attributes accept: params[:accept]
      redirect_to admin_book_path(@book)
    end
  end
end