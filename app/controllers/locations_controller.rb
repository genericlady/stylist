class LocationsController < ApplicationController
  PAGE_SIZE = 10

  def index
    @page = (params[:page] || 0).to_i

    if params[:search_terms].present?
      @search_terms = params[:search_terms]
      location_search = LocationSearch.new(@search_terms, PAGE_SIZE, @page)
      @locations = location_search.query
    else
      @locations = []
    end


    respond_to do |format|
      format.json { render json: @locations.to_json(include: [:user]) }
    end

  end
end
