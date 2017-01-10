class StylistSearch

  def self.run(query)
    query = query || blank_query

    full_query = query[:terms] + query[:location]

    if query[:location].blank? && query[:terms].blank?
      top_20

    elsif query[:location].blank? && !query[:terms].blank?

      User.joins(:locations).search_by_name(full_query)

    elsif (!query[:location].blank? && !query[:terms].blank?) ||
          (!query[:location].blank? && query[:terms].blank?)

      User.joins(:locations).search_by_name_and_location(full_query)
    else
      top_20
    end

  end

  def self.blank_query
    {
      query_type: 'stylist',
      terms: '',
      location: '',
    }
  end

  def self.top_20
    User.all.includes(:locations)
  end
end
