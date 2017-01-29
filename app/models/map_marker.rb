class MapMarker
  def self.to_markers(results, query)
    case query[:type]
    when /name/i
      create_beauty_provider_markers(results, query)
    when /service/i
      create_service_markers(results, query)
    end
  end

  def self.create_beauty_provider_markers(results, query=nil)
    if query.nil? || query[:location].empty?
     MapMarker.new_for_each_beauty_provider(results)
    else
     location_expression = LocationExpression.create(query)
     MapMarker.new_for_each_beauty_provider(results, location_expression)
    end
  end

  def self.create_service_markers(results, query=nil)
    if query.nil? || query[:location].empty?
     MapMarker.new_for_each(results)
    else
     location_expression = LocationExpression.create(query)
     MapMarker.new_for_each(results, location_expression)
    end
  end

  def self.new_from_user(user)
    user.locations.reduce([]) do |markers, location|
      label = user.first_name[0..1]
      coords =
        {
          lat: location.latitude,
          lng: location.longitude,
        }
      markers << { position: coords, label: label }
    end
  end


  def self.new_for_each_beauty_provider(beauty_providers, expression = nil)
    beauty_providers.reduce([]) do |markers, beauty_provider|
      beauty_provider.locations.each do |l|
        location = Location.new(l)
        if expression.nil? || location.full_address.match(expression)
          label = beauty_provider.full_name_string[0..1]
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
