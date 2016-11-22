class LocationSearch < Search

  def query
    if !location_empty? && !name_empty?
      Location.stylist_name_search(terms[:name] + " " + terms[:location]).includes(:user)
    elsif !location_empty?
      Location.search(terms[:location]).includes(:user)
    end
  end

end
