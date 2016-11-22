class Search
  attr_reader :terms, :page_size, :page

  def initialize(terms, page_size, page)
    @terms = terms
    @page_size = page_size
    @page = page
  end

  private
  def location_empty?
    terms[:location].empty?
  end

  def name_empty?
    terms[:name].empty?
  end
end

