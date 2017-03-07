class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  # after_action :verify_authorized
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def create_user_license
    @user.licenses.create user_license_params[:license]
  end

  def query
    permitted_query_params[:query] || empty_stylist_query
  end

  def permitted_query_params
    params.permit(query: [:type, :terms, :location])
  end

  def empty_stylist_query
    {
      type: 'stylist',
      terms: '',
      location: '',
    }
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(:first_name, :last_name, :password, :password_confirmation, :email, :zipcode, :identification, :selfie, {locations_attributes: [:address1, :address1, :city, :state, :zip]})
    end
  end

  def user_params
    params.
      require(:user).
      permit(
        :name,
        :email,
        :password,
        :password_confirmation,
        :identification,
        :selfie,
        licenses_attributes: [ 
          :image,
          :expiration,
          :full_name,
          :number,
          :state,
          :license_type,
        ]
    )
  end

  def user_license_params
    params.
      require(:user).
      permit(
        license: [
        :image,
        :expiration,
        :full_name,
        :number,
        :state,
        :license_type,
        ]
      )
  end

end
