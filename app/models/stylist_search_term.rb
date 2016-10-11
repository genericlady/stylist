class StylistSearchTerm
  attr_reader :where_clause, :where_args, :order
  
  def initialize(search_term)
    search_term = search_term.downcase
    @where_clause = ""
    @where_args = {}
    build_search(search_term)
  end
  
  def build_search(search_term)
    # "locations.address1 = ?", "foo"
    @where_clause << case_insensitive_search(:city)
    @where_args[:city] = starts_with(search_term)
    
    @where_clause << " OR #{case_insensitive_search(:state)}"
    @where_args[:state] = starts_with(search_term)
    
    @where_clause << " OR #{case_insensitive_search(:address1)}"
    @where_args[:address1] = starts_with(search_term)
    
    @where_clause << " OR #{case_insensitive_search(:address2)}"
    @where_args[:address2] = starts_with(search_term)
    
    @order = "address1 asc"
  end
  
  def starts_with(search_term)
    search_term + "%"
  end
  
  def case_insensitive_search(field_name)
    "lower(#{field_name}) like :#{field_name}"
  end

end
