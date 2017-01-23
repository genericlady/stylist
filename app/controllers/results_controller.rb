class ResultsController < ApplicationController
  def index
    @results =
        Search.
        new(query).
        results

    @markers = MapMarker.to_markers(@results, query)
  end

end
