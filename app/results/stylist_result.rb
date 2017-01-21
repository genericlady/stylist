class StylistResult
  include ActionView::Helpers::TagHelper
  include Result::Base

  def initialize(stylist_hash)
    @stylist = stylist_hash
  end

  def image
    '/some/url/to/default_professional.png'
  end

  def title
    content_tag(:a, full_name_string, href: path_to_stylist)
  end

  def subtitle
    "Senior Stylist"
  end

  def locations
    stylist["locations"]
  end

  def print_locations
    locations.
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

  def full_name_string
    stylist["first_name"] + " " + stylist["last_name"]
  end

  def path_to_stylist
    '/stylists/' + stylist["id"].to_s
  end

end
