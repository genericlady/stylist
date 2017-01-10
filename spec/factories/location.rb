FactoryGirl.define do
  factory :new_york, class: Location do
    address1 '224 west 4th street'
    city 'New York'
    state 'NY'
    zip '10014'
    latitude 40.7338569
    longitude -74.003074
  end

  factory :brooklyn, class: Location do
    address1 '178 n 8th St'
    address2 'n 11211'
    city 'Brooklyn'
    state 'NY'
    zip '11211'
    latitude 40.7179553
    longitude -73.95676019999999
  end

  factory :chicago, class: Location do
    address1 '35 W Wacker Dr'
    city 'Chicago'
    state 'IL'
    zip '60601'
    latitude 41.8865829
    longitude -87.6291883
  end

  factory :san_francisco, class: Location do
    address1 '55 Grant Ave'
    city 'San Francisco'
    state 'CA'
    zip '94108'
    latitude 37.7874605
    longitude -122.4052728
  end

  factory :beverly_hills, class: Location do
    address1 '9681 Wilshire Blvd'
    city 'Beverly Hills'
    state 'CA'
    zip '90212'
    latitude 34.0673228
    longitude -118.4051334
  end

end

