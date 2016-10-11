class StylistsController < ApplicationController
  def index
    if params[:stylist] && params[:near]
      @search_term = params[:stylist] + params[:near]
      stylist_search_term = StylistSearchTerm.new(@search_term)
      @stylists =
        User.joins(:locations)
            .where(
              stylist_search_term.where_clause,
              stylist_search_term.where_args
            )
    else
      @stylists = []
    end
  end
  
end
