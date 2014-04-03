class ReviewsController < ApplicationController
  load_and_authorize_resource params_method: :review_params
  before_action :correct_user, only: [:edit, :update, :destroy]

  def create
    @review = current_user.reviews.build review_params
    @review.user_id = current_user.id
    if @review.save
      flash[:success] = "Created"
      redirect_to book_path(@review.book)
    else
      render 'new'
    end
  end

  def edit
    @review = Review.find params[:id]
  end

  def update
    @review = Review.find params[:id]
    @review.update_attributes review_params
    if @review.save
      flash[:success] = "Updated"
      redirect_to book_path(@review.book)
    else
      render "edit"
    end
  end

  def destroy
    review = Review.find params[:id]
    review.destroy
    flash[:success] = "Deleted"
    redirect_to book_path(@review.book)
  end

  private
    def review_params
      params.require(:review).permit(:book_id, :content)
    end

    def correct_user
      @review = current_user.reviews.find_by_id params[:id]
      redirect_to root_url if @review.nil?
    end
end