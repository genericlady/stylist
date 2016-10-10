class LocationSearchTerm
  attr_reader :where_clause, :where_args, :order
  
  def initialize(search_term)
    search_term = search_term.downcase
    @where_clause = ""
    @where_args = {}
    build_search(search_term)
  end
  
  def build_search(search_term)
    @locations = Location
      .includes(:users)
      .where(users: {})
    # @where_clause << case_insensitive_search(:first_name)
    # @where_args[:first_name] = starts_with(search_term)
    # 
    # @where_clause << " OR #{{case_insensitive_search(:last_name)}}"
    # @where_args[:last_name] = starts_with(search_term)
    # 
    # @where_clause << case_insensitive_search(:location)
    # @where_args[:location] = search_term
    # 
    # @order = "location asc"
  end
  
  def starts_with(search_term)
    # search_term + "%"
  end
  
  def case_insensitive_search(field)
    # "lower(#{field_name}) like :#{field_name}"
  end
  
  def extract_address(location)
  end
end
