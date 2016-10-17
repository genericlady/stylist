class StylistSearchTerm
  attr_reader :where_clause, :where_args, :order
  
  def initialize(search_terms)
        @where_args = {}
      @where_clause = ""
    @location_terms = []
        @name_terms = ""
        
    set_location_terms(search_terms)
    set_name_terms(search_terms)
    
    if @location_terms.length == 2 && !@name_terms.empty?
      build_name_city_and_state_search 
    elsif @location_terms.length == 1 && !@name_terms.empty?
      build_name_city_or_state_search
    elsif !search_terms[:near].empty?
      build_location_search
    elsif !search_terms[:stylist].empty?
      build_name_search
    end
  end
  
  def set_location_terms(search_terms)
    if !search_terms[:near].empty?
      @location_terms = scan_near_terms(search_terms[:near])  
    end
  end
  
  def set_name_terms(search_terms)
    if !search_terms[:stylist].empty?  
      @name_terms = search_terms[:stylist]  
    end
  end
  
  def scan_near_terms(near_terms)
    near_terms.scan(/(?:\b[\p{L}][\p{L}`-]+\s*)+/io)
  end
  
  private
  def build_name_search
    @where_clause << case_insensitive_search(:first_name)
    @where_args[:first_name] = starts_with(first_name)

    @where_clause << " AND #{case_insensitive_search(:last_name)}"
    @where_args[:last_name] = starts_with(last_name)
    @order = "last_name ASC "  
  end
  
  def build_name_city_or_state_search
    @where_clause << case_insensitive_search(:city)
    @where_args[:city] = starts_with(city)

    @where_clause << " AND #{case_insensitive_search(:first_name)}"
    @where_args[:first_name] = starts_with(first_name)
    
    @where_clause << " AND #{case_insensitive_search(:last_name)}"
    @where_args[:last_name] = starts_with(last_name)
    
    @where_clause << " OR #{case_insensitive_search(:state)}"
    @where_args[:state] = starts_with(state)
      
    @where_clause << " AND #{case_insensitive_search(:first_name)}"
    @where_args[:first_name] = starts_with(first_name)
    
    @where_clause << " AND #{case_insensitive_search(:last_name)}"
    @where_args[:last_name] = starts_with(last_name)
    
    @order = "city = " +
      ActiveRecord::Base.connection.quote(city) +
      " asc, last_name asc"
  
  end
  
  def build_name_city_and_state_search
    @where_clause << case_insensitive_search(:city)
    @where_args[:city] = starts_with(city)

    @where_clause << " AND #{case_insensitive_search(:state)}"
    @where_args[:state] = starts_with(state)
      
    @where_clause << " AND #{case_insensitive_search(:first_name)}"
    @where_args[:first_name] = starts_with(first_name)
    
    @where_clause << " AND #{case_insensitive_search(:last_name)}"
    @where_args[:last_name] = starts_with(last_name)
    
    @order = "city = " +
      ActiveRecord::Base.connection.quote(city) +
      " asc, last_name asc"
  
  end
  
  def build_location_search
    @where_clause << case_insensitive_search(:city)
    @where_args[:city] = starts_with(city)

    @where_clause << " OR #{case_insensitive_search(:state)}"
    @where_args[:state] = starts_with(state)
 
    @order = "city = " +
      ActiveRecord::Base.connection.quote(city) +
      " DESC, last_name ASC"
  end
  
  def starts_with(keyword)
    keyword + "%"
  end
  
  def case_insensitive_search(field_name)
    "lower(#{field_name}) like :#{field_name}"
  end
  
  def city
    @location_terms.first
  end
  
  def state
    @location_terms.last
  end
  
  def first_name
    @name_terms.split(', ').first
  end
  
  def last_name
    names = @name_terms.split(', ')
    if names.length > 1
      names.last
    else
      ""
    end
  end

end
