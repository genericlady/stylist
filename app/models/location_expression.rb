class LocationExpression

  def self.create(query)
    Regexp.new(location_terms_string(query[:location]), true)
  end

  private

  def self.location_terms_string(terms)
    terms.split(/\s|,\s/).map do |t|
      t + '\b'
    end.join('|')
  end

end
