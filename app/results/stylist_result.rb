class StylistResult
  include Result::Base

  def initialize(stylist_hash)
    @stylist = stylist_hash
  end

  def image
    '/some/url/to/default_professional.png'
  end

  def title
    stylist["first_name"] + " " + stylist["last_name"]
  end

  def subtitle
    "Senior Stylist"
  end

  def locations
    stylist["locations"]
  end

  def print_locations
    stylist["locations"].
      map do |l|
        "#{l["city"]}, #{l["state"]}"
      end.join(' | ')
  end

  def rating
    "*****"
  end

  def total_reviews
    "120"
  end

  def locatable?
    true
  end

  private
  def stylist
    @stylist || {}
  end
end
