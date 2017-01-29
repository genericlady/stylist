class ServiceResult
  include ActionView::Helpers::TagHelper
  include Result::Base

  def initialize(service_hash)
    @service = service_hash["service"]
  end

  def image
    '/some/url/to/default_professional.png'
  end

  def title
    content_tag(
      :a,
      service["name"] + " by " + user_full_name,
      href: path_to_user
    )
  end

  def subtitle
    "$" + service["price"].to_s
  end

  def print_locations
    locations.
      map do |l|
        "#{l["city"]}, #{l["state"]}"
      end.join(' | ')
  end

  def locations
    service["locations"]
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
  def service
    @service || {}
  end

  def user_full_name
    service["user"]["first_name"] +
    " " +
    service["user"]["last_name"]
  end

  def link_to_user
    content_tag(:a, user_full_name, href: path_to_user)
  end

  def path_to_user
    '/users/' + user_id
  end

  def user_id
    service["user"]["id"].to_s
  end
end
