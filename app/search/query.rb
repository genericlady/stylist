class Query
  attr_accessor :location, :terms, :type

  def initialize(query)
    @terms    = query[:terms]
    @location = query[:location]
    @type     = query[:type]
  end

  def to_string
    if terms.empty?
      query_string = location
    elsif location.empty?
      query_string = terms
    elsif
      query_string = terms + " " + location
    end
    query_string
  end

  def empty?
    terms.empty? && location.empty?
  end

end
