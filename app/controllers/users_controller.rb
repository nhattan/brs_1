class UsersController < ApplicationController
  load_and_authorize_resource

  def destroy
    user = User.find params[:id]
    user.destroy
    flash[:success] = "Deleted"
    redirect_to users_url
  end
end
