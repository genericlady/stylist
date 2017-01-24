class ResultsController < ApplicationController
  def index
    @results =
        Search.
        new(query).
        results

    # when the query is a service this is failing
    @markers = MapMarker.to_markers(@results, query)
  end

end
