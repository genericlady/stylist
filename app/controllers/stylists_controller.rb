class StylistsController < ApplicationController
  def index
    if !near_empty?
      @search_terms = search_terms
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
  
  private
  def search_terms
    params[:search_terms]
  end
  
  def stylist_empty?
    search_terms[:stylist].empty?
  end
  
  def near_empty?
    search_terms[:near].empty?
  end
  
end
