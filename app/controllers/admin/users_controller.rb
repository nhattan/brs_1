class Admin::UsersController < ApplicationController
  before_filter :authenticate_admin!
  load_and_authorize_resource param_method: :user_params

  def destroy
    user = User.find params[:id]
    user.destroy
    flash[:success] = "Deleted"
    redirect_to admin_users_url
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
        :password_confirmation)
    end
end
