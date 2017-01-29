class Search
  attr_accessor :query

  def initialize(query)
    @query = query
  end

  def results
    case query[:type]
    when /service/i
      service_results
    when /beauty_provider/i
      beauty_provider_results
    end
  end

  private
  def beauty_provider_results
    BeautyProviderSearch.
      new(query).
      results.
      as_json(include: :locations).
      map { |result| BeautyProviderResult.new(result) }
   
  end

  def service_results
    #
    # Once the Service models are added to the db
    # then we can use the as_json call to include
    # the associated locations
    #
    # ServiceSearch.
    #   new(query).
    #   results.
    #   as_json(include: :locations).
    #   map { |result| BeautyProviderResult.new(result) }
    #

    results = ServiceSearch.
      new(query).
      results.
      map { |result| ServiceResult.new(result) }

  end

end
