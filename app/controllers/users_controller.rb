class UsersController < ApplicationController
  load_and_authorize_resource

  def show
    @versions = PaperTrail::Version.order('created_at DESC')  
  end

  def index
    if params[:follow] == "following"
      @user = User.find params[:id]
      @title = "Following"
      @users = @user.followed_users
      render 'show_follow'
    elsif params[:follow] == "followers"
      @user = User.find params[:id]
      @title = "Followers"
      @users = @user.followers
      render 'show_follow'
    else
      @users = User.all
    end    
  end

  def destroy
    user = User.find params[:id]
    user.destroy
    flash[:success] = "Deleted"
    redirect_to users_url
  end
end
