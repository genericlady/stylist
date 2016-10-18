class StylistsController < ApplicationController
  def index
    if params[:search_terms].present?
      @search_terms = params[:search_terms]
      @stylists = StylistSearch.resolve(@search_terms)
    else
      @stylists = []
    end
  end
  
end
