class StylistsController < ApplicationController

  def index
    query = params_for_query[:query]

    search_results =
      StylistSearch.
        run(query).
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

  private

  def params_for_query
    params.permit(query: [:type, :terms, :location])
  end

end
