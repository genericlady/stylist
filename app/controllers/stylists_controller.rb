class StylistsController < ApplicationController
  def index
    if params[:search_terms].present?
      @search_terms = params[:search_terms]
      stylist_search_term = StylistSearchTerm.new(@search_terms)
      @stylists =
        User.joins(:locations)
            .where(stylist_search_term.where_clause,
                   stylist_search_term.where_args)
            .order(stylist_search_term.order)
    else
      @stylists = []
    end
  end
  
end
