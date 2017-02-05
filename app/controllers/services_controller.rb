class ServicesController < ApplicationController
  def show
    @service = Service.find params[:id]
  end

  def edit
    @service = Service.find params[:id]
  end

  def new
  end

  def update
    @service = current_user.services.find params[:id]
    @service.update (service_params)
    flash[:notice] = "Your service has been updated successfully"
    redirect_to user_service_path @service
  end

  def create
    @service = current_user.services.create(service_params)

    if @service.save
      redirect_to user_service_path current_user, @service
    else
      render 'new'
    end
  end

  private
  def service_params
    params.require(:service).permit(:id, :name, :description, :price)
  end
end
