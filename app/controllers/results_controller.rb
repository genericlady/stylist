class ResultsController < ApplicationController
  def index
    @results =
        Search.
        new(query).
        results

    create_markers
  end

  private
  def create_markers
    if query.nil? || query[:location].empty?
     @markers = MapMarker.new_for_each(@results)
    else
     location_expression = LocationExpression.create(query)
     @markers = MapMarker.new_for_each(@results, location_expression)
    end
  end

end