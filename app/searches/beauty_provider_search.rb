class BeautyProviderSearch
  def initialize(query)
    @query = query
  end

  def results
    if location_blank? && terms_blank?
      top_20
    elsif location_blank? && !terms_blank?
      User.search_by_name(full_query).includes(:locations)
    elsif (!location_blank? && !terms_blank?) ||
          (!location_blank? && terms_blank?)
      User.search_by_name_and_location(full_query).includes(:locations)
    else
      top_20
    end

  end

  def top_20
    User.all.limit(20).includes(:locations)
  end

  private
  def query
    @query || blank_query
  end

  def blank_query
    {
      query_type: 'stylist',
      terms: '',
      location: '',
    }
  end

  def terms_blank?
    query[:terms].blank?
  end

  def location_blank?
    query[:location].blank?
  end

  def full_query
    if terms_blank? && location_blank?
      ""
    elsif terms_blank?
      query[:location]
    else
      query[:terms] + " " + query[:location]
    end
  end

end
