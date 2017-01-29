class Search
  def initialize(query)
    @query = Query.new(query)
  end

  def results
    serialized_service_results.
      map { |result| ServiceResult.new(result) }
  end

  private
  attr_reader :query

  def serialized_service_results
    fetch_services.as_json(include: [:locations, :user])
  end

  def fetch_services
    Service.includes(:user, :locations).search(query)
  end
end
