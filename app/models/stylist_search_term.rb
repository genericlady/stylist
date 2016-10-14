class StylistSearchTerm
  attr_reader :where_clause, :where_args, :order
  
  def initialize(search_terms)
    @where_clause = ""
    @where_args = {}
    # handle exception if search_term contains no strings or contains null
    if !search_terms[:stylist].empty? && !search_terms[:near].empty?
      @location_terms = search_terms[:near]
      @name_terms     = search_terms[:name]
      build_name_search 
    elsif !search_terms[:near].empty?
      @location_terms = search_terms[:near]
      build_location_search
    end
  end
  
  def biuld_name_search
    
    @where_clause << case_insensitive_search(:city)
    @where_args[:city] = starts_with(city)

    @where_clause << " OR #{case_insensitive_search(:state)}"
    @where_args[:state] = starts_with(state)
      
    @where_clause << " OR #{case_insensitive_search(:first_name)}"
    @where_args[:first_name] = starts_with(first_name)
    
    @where_clause << " OR #{case_insensitive_search(:last_name)}"
    @where_args[:last_name] = starts_with(last_name)
    
    @order = "city = " +
      ActiveRecord::Base.connection.quote(city) +
      " desc, last_name asc"
  
  end
  
  def build_location_search
    
    @where_clause << case_insensitive_search(:city)
    @where_args[:city] = starts_with(city)

    @where_clause << " OR #{case_insensitive_search(:state)}"
    @where_args[:state] = starts_with(state)
 
    @order = "city = " +
      ActiveRecord::Base.connection.quote(city) +
      " desc, last_name asc"
  end
  
  def starts_with(keyword)
    keyword + "%"
  end
  
  def case_insensitive_search(field_name)
    "lower(#{field_name}) like :#{field_name}"
  end
  
  def city
    @search_terms[:near].split(' ').first
  end
  
  def state
    @search_terms[:near].split(' ').last
  end
  
  def first_name
    @search_terms[:stylist].split(',').first
  end
  
  def last_name
    @search_terms[:stylist].split(',').last
  end

end
