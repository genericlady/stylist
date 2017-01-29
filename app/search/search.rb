class Search
  def initialize(query)
    @query = Query.new(query)
  end

  def results
    # if the serialized results have root keys denoting what they are then
    # our result factory will know which new result to instantiate
    serialized_results.map { |result| ResultFactory.new_result(result) }
  end

  private
  attr_reader :query

  def serialized_results
    case query.type
    when /service/i
      serialized_services
    when /name/i
      binding.pry
      serialized_providers
    end
  end

  def serialized_mixed_results
  end

  def serialized_providers
    provider_results.as_json(root: true, include: [:locations, :services])
  end

  def serialized_services
    service_results.as_json(root: true, include: [:locations, :user])
  end

  def service_results
    Service.includes(:user, :locations).search(query)
  end

  def provider_results
    User.includes(:services, :locations).search_by_name_and_location(query.to_s)
  end

  def mixed_search
  end
end
