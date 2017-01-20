class ServiceResult
  include Result::Base

  def initialize(service_hash)
    @service = service_hash
  end

  def image
    '/some/url/to/default_professional.png'
  end

  def title
    'Service by Georganne Summers'
  end

  def subtitle
    "$190"
  end

  def locations
    'New York, NY | San Francisco, CA'
    # service["locations"].
    #   map do |l|
    #     "#{l["city"]}, #{l["state"]}"
    #   end.join(' | ')
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
end
