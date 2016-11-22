class StylistSearch < Search
  def query
    if !name_empty?
      User.name_search(terms[:name]).includes(:locations)
    end
  end

end
