class CommentsController < ApplicationController
  load_and_authorize_resource params_method: :comment_params
  before_action :correct_user, only: [:edit, :update, :destroy]

  def create
    @review = Review.find params[:review_id]
    @book = @review.book
    @comment = @review.comments.build comment_params
    @comment.user_id = current_user.id
    if @comment.save
      respond_to do |format|
        format.html { redirect_to @book }
        format.js
      end
    else
      render "edit"
    end
  end

  def edit
    @review = Review.find params[:review_id]
    @book = @review.book
  end

  def update
    @review = Review.find params[:review_id]
    @book = @review.book
    if @comment.update_attributes comment_params
      respond_to do |format|
        format.html { redirect_to @book }
        format.js
      end
    else
      render "edit"
    end
  end

  def destroy
    @comment = Comment.find params[:id]
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to @comment.review.book }
      format.js
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:content)
    end

    def correct_user
      @comment = current_user.comments.find_by_id params[:id]
      redirect_to root_url if @comment.nil?
    end
end