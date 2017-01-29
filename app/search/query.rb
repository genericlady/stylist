class Query
  def initialize(query)
    @terms = query[:terms]
    @location = query[:location]
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

  private
  attr_reader :location, :terms

end
