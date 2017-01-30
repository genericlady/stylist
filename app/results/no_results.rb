class NoResults
  include ActionView::Helpers::TagHelper
  include Result::Base

  def initialize
    @result = "No Results"
  end

  def image
    ''
  end

  def title
    "#{@result}, try another search"
  end

  def subtitle
    ""
  end

  def print_locations
    ""
  end

  def locations
    ""
  end

  def rating
    ""
  end

  def total_reviews
    ""
  end

  def locatable?
    false
  end
end
