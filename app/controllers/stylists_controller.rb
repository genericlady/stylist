class StylistsController < ApplicationController

  def index
    query = permitted_query_params[:query]
    stylist_search = StylistSearch.new(query)

    search_results =
      stylist_search.
        results.
        as_json(include: :locations)

    @stylists =
      Kaminari.
      paginate_array(search_results).
        page(params[:page]).
        per(10)

    if query.nil? || query[:location].empty?
     @markers = MapMarker.new_for_each(@stylists)
    else
     location_expression = LocationExpression.create(query)
     @markers = MapMarker.new_for_each(@stylists, location_expression)
    end

    respond_to do |format|
      format.html {}
      format.json { render json: @stylists.to_json(include: [:locations]) }
    end
  end

end
