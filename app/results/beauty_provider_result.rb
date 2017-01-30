class BeautyProviderResult
  include ActionView::Helpers::TagHelper
  include Result::Base

  def initialize(beauty_provider_hash)
    @beauty_provider = beauty_provider_hash["user"]
  end

  def image
    'head-massage-emoji.png'
  end

  def title
    content_tag(:a, full_name_string, href: path_to_beauty_provider)
  end

  def subtitle
    "Senior Stylist"
  end

  def locations
    beauty_provider["locations"]
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

  def full_name_string
    beauty_provider["first_name"] + " " + beauty_provider["last_name"]
  end

  private
  def beauty_provider
    @beauty_provider || {}
  end

  def path_to_beauty_provider
    '/users/' + beauty_provider["id"].to_s
  end

end
