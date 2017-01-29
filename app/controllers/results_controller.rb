class ResultsController < ApplicationController
  def index
    @results =
        Search.
        new(query).
        results

    @markers = MapMarker.create_service_markers(@results, query)
  end

end
