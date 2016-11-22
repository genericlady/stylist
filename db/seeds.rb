locations = [
  {
    address1: '224 west 4th street',
    city: 'New York',
    state: 'NY',
    zip: '10014',
    latitude: '40.7338569',
    longitude: '-74.003074'
  },
  {
    address1: '178 n 8th St',
    address2: 'n 11211',
    city: 'Brooklyn',
    state: 'NY',
    zip: '11211',
    latitude: '40.7179553',
    longitude: '-73.95676019999999' 
  },
  {
    address1: '55 Grant Ave',
    city: 'San Francisco',
    state: 'CA',
    zip: '94108',
    latitude: '37.7874605',
    longitude: '-122.4052728'
  },
  {
    address1: '35 W Wacker Dr',
    city: 'Chicago',
    state: 'IL',
    zip: '60601',
    latitude: '41.8865829',
    longitude: '-87.6291883'
  },
  {
    address1: '3500 W 6th St #325',
    address2: 'City Center on 6th',
    city: 'Los Angeles',
    state: 'CA',
    zip: '90020',
    latitude: '34.0631379',
    longitude: '-118.298559'
  }
]

100.times do |i|
  user = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    username: "#{Faker::Internet.user_name}#{i}",
    password: Faker::Internet.password(10),
    email: Faker::Internet.user_name + i.to_s +
    "@#{Faker::Internet.domain_name}"
  )
  user.locations.create(locations[rand(locations.length-1)])
  user.locations.create(locations.last)
  user.save
end

puts "users created"
