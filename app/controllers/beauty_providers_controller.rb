class BeautyProvidersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @markers = MapMarker.new_from_user(@user)
  end

  def index
  end
end
