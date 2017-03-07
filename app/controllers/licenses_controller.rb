class LicensesController < ApplicationController
  before_action :redirect_to_providers_new,
    unless: :license_exists?,
    except: [:create]

  def edit
    @user = get_user
    @license = find_user_license

    authorize @license
  end

  def update
    @user = get_user
    @license = find_user_license
    @license.update_attributes license_attributes

    authorize @license
    redirect_to new_provider_path, flash: { success: "Update complete!" }
  end

  def create
    @user = get_user
    @license = @user.licenses.build license_params
    authorize @license
    @user.save
    redirect_to new_provider_path,
      flash: { success: "Creation of license is a success!" }
  end

  def destroy
    @user = get_user

    license = find_user_license
    license.destroy
    @license = @user.licenses.new

    authorize @license
    redirect_to new_provider_path, flash: { success: "License deleted" }
  end

  protected
  def get_user
    User.find params[:user_id]
  end

  def find_user_license
    @user.licenses.find(params[:id])
  end

  def license_exists?
    License.exists?(params[:id]) 
  end

  def license_attributes
    params.
      require(:license).
      permit(
        :license_type,
        :number,
        :full_name,
        :state)
  end

  def license_params
    params.
      require(:license).
      permit(
        :license_type,
        :number,
        :full_name,
        :state
      )
  end

  def redirect_to_providers_new
    redirect_to new_provider_path
  end
end
