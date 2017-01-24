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

  def print_locations
    'New York, NY | San Francisco, CA'
  end

  def locations
    [
      {
        "id"=>5,
        "user_id"=>6,
        "address1"=>"35 W Wacker Dr",
        "address2"=>nil,
        "city"=>"Chicago",
        "state"=>"IL",
        "zip"=>"60601",
        "latitude"=>41.8865829,
        "longitude"=>-87.6291883
      },
      {
        "id"=>6,
        "user_id"=>6,
        "address1"=>"178 n 8th St",
        "address2"=>"n 11211",
        "city"=>"Brooklyn",
        "state"=>"NY",
        "zip"=>"11211",
        "latitude"=>40.7179553,
        "longitude"=>-73.95676019999999
      }
    ]
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
