class MapMarker
  attr_reader :lat, :lng

  def initialize(location)
    @lat = location[:position][:lat]
    @lng = location[:position][:lng]
  end

  def self.new_for_each(stylists, expression = nil)
    stylists.reduce([]) do |markers, s|
      s["locations"].each do |l|
        location = Location.new(l)
        if expression.nil? || location.full_address.match(expression)
          initials = s["first_name"].first + s["last_name"].first
          coords =
            {
              lat: location.latitude,
              lng: location.longitude
            }
          markers << {position: coords, label: initials}
        end
      end
      markers
    end
  end

end
