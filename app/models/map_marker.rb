class MapMarker
  def self.to_markers(results, query)
    case query[:type]
    when /stylist/i
      create_stylist_markers(results, query)
    when /service/i
      create_service_markers(results, query)
    end
  end

  def self.create_stylist_markers(results, query=nil)
    if query.nil? || query[:location].empty?
     MapMarker.new_for_each_stylist(results)
    else
     location_expression = LocationExpression.create(query)
     MapMarker.new_for_each_stylist(results, location_expression)
    end
  end

  def self.create_service_markers(results, query=nil)
    if query.nil? || query[:location].empty?
     MapMarker.new_for_each(@results)
    else
     location_expression = LocationExpression.create(query)
     MapMarker.new_for_each(@results, location_expression)
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


  def self.new_for_each_stylist(stylists, expression = nil)
    stylists.reduce([]) do |markers, stylist|
      stylist.locations.each do |l|
        location = Location.new(l)
        if expression.nil? || location.full_address.match(expression)
          label = stylist.full_name_string[0..1]
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
