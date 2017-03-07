class ProvidersController < ApplicationController
  def new
    @user = current_user
    @license = @user.licenses.new
    authorize @license
  end

  def edit
    @user = get_user
    @license = @user.licenses.new
  end

  def update
    @user = get_user
    @user.update_attributes(user_params)
    authorize @user
    redirect_to new_provider_path, flash: { success: "User has been updated." }
  end

  private
  def get_user
    User.find(params[:id])
  end

end
