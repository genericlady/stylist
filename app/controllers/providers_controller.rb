class ProvidersController < ApplicationController
  def new
    @user = current_user
    @license = @user.licenses.new
  end

  def edit
    @user = User.find(params[:id])
    @license = @user.licenses.new
  end

  def update
    @user = User.find(params[:id])
    @license = @user.licenses.new
    @user.update_attributes(user_params)
    render 'new'
  end

end
