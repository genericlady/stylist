class ResultsController < ApplicationController
  def index
    # Refactor into a factory
    @results =
        Search.
        new(query).
        results

    @markers = MapMarker.to_markers(@results, query)
  end

end
