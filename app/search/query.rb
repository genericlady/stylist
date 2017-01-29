class Query
  attr_accessor :location, :terms, :type

  def initialize(query)
    @terms    = query[:terms]
    @location = query[:location]
    @type     = query[:type]
  end

  def to_s
    if terms.empty?
      location
    elsif location.empty?
      terms
    elsif
      terms + " " + location
    end
  end

end
