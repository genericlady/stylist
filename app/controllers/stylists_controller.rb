class StylistsController < ApplicationController
  PAGE_SIZE = 10

  def index
    @page = (params[:page] || 0).to_i

    if params[:search_terms].present?
      @search_terms = params[:search_terms]
      stylist_search = StylistSearch.new(@search_terms, PAGE_SIZE, @page)
      @stylists = stylist_search.query
    else
      @stylists = []
    end

    respond_to do |format|
      format.html {}
      format.json { render json: @stylists.to_json(include: [:locations]) }
    end
  end
  
end
