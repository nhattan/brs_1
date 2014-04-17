class LikesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  
  def create
    @activity = Activity.find params[:activity_id]
    @like = @activity.likes.build user: current_user
    if @like.save
      respond_to do |format|
        format.html{ redirect_to root_path }
        format.js
      end
    end
  end

  def destroy
    @activity = Activity.find params[:activity_id]
    @like = Like.find params[:id]
    @like.destroy
    respond_to do |format|
      format.html{ redirect_to root_path }
      format.js
    end
  end
end