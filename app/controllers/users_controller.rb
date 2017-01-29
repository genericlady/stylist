class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @markers = MapMarker.new_from_user(@user)
  end

  def update
  end

  private
  def user_params
    params.
      require(:user).
      permit(
        :name,
        :email,
        :password,
        :password_confirmation
      )
  end
end
