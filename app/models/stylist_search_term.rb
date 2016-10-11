class StylistSearchTerm
  attr_reader :where_clause, :where_args, :order, :search_term
  
  def initialize(search_term)
    @search_term = search_term
    @where_clause = ""
    @where_args = {}
    build_search
  end
  
  def build_search
    @where_clause << case_insensitive_search(:city)
    @where_args[:city] = starts_with(city)
    
    @where_clause << " OR #{case_insensitive_search(:state)}"
    @where_args[:state] = starts_with(state)
    
    # @where_clause << " OR #{case_insensitive_search(:address1)}"
    # @where_args[:address1] = starts_with(search_term[:near])
    # 
    # @where_clause << " OR #{case_insensitive_search(:address2)}"
    # @where_args[:address2] = starts_with(search_term[:near])
    
    @where_clause << " OR #{case_insensitive_search(:first_name)}"
    @where_args[:first_name] = starts_with(first_name)
    
    @where_clause << " OR #{case_insensitive_search(:last_name)}"
    @where_args[:last_name] = starts_with(last_name)
    
    @order = "city = " +
      ActiveRecord::Base.connection.quote(city) +
      " desc, last_name asc"
  end
  
  def starts_with(search_term)
    search_term + "%"
  end
  
  def case_insensitive_search(field_name)
    # "lower(#{field_name}) like :#{field_name}"
    "#{field_name} like :#{field_name}"
  end
  
  def city
    search_term[:near].split(' ').first
  end
  
  def state
    search_term[:near].split(' ').last
  end
  
  def first_name
    binding.pry
    search_term[:stylist].split(',').first
  end
  
  def last_name
    search_term[:stylist].split(',').last
  end

end
