class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

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

end
