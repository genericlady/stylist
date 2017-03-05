class ProvidersController < ApplicationController
  def new
    @user = current_user
    @license = @user.licenses.new
  end

  def edit
    @user = get_user
    @license = @user.licenses.new
  end

  def update
    @user = get_user
    @license = @user.licenses.new
    @user.update_attributes(user_params)
    create_user_license
    render 'new'
  end

end
