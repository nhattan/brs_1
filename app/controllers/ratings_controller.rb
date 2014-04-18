class RatingsController < ApplicationController
  load_and_authorize_resource param_method: :rating_params

  def create
    @book = Book.find params[:book_id]
    @rating = @book.ratings.build rating_params
    @rating.user_id = current_user.id
    if @rating.save
      respond_to do |format|
        format.json{ render json: { avg_rating: @book.avg_rating } }
      end
    end
  end

  def update
    @book = Book.find params[:book_id]
    @rating = Rating.find params[:id]
    if @rating.update_attributes rating_params
      respond_to do |format|
        format.json{ render json: { avg_rating: @book.avg_rating } }
      end
    end
  end

  private
    def rating_params
      params.require(:rating).permit(:stars)
    end
end