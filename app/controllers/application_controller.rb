class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?


  private
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
      user_params.permit(:first_name, :last_name, :password, :password_confirmation, :email, :zipcode, {locations_attributes: [:address1, :address1, :city, :state, :zip]})
    end
  end
end
