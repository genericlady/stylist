class StylistsController < ApplicationController
  def index
    if params[:search_terms].present?
      @search_terms = params[:search_terms]
      # stylist_search_sql = StylistSearchSQL.new(@search_terms)
      @stylists = StylistSearch.resolve(@search_terms)
        # User.joins(:locations)
        #     .where(stylist_search_sql.where_clause,
        #            stylist_search_sql.where_args)
        #     .order(stylist_search_sql.order)
    else
      @stylists = []
    end
  end
  
end
