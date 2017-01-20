class MapMarker
  def self.new_for_each(results, expression = nil)
    results.reduce([]) do |markers, result|
      result.locations.each do |l|
        location = Location.new(l)
        if expression.nil? || location.full_address.match(expression)
          label = result.title[0..1]
          coords =
            {
              lat: location.latitude,
              lng: location.longitude
            }
          markers << {position: coords, label: label}
        end
      end
      markers
    end
  end

end
