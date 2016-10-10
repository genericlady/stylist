locations = [
  {
    address1: '224 west 4th street',
     city: 'New York',
    state: 'NY',
      zip: '10014'
  },
  {
    address1: '178 n 8th St',
    address2: 'n 11211',
     city: 'Brooklyn',
    state: 'NY',
      zip: '11211'
  },
  san_fran    = {
    address1: '55 Grant Ave',
     city: 'San Francisco',
    state: 'CA',
      zip: '94108'
  },
  {
    address1: '35 W Wacker Dr',
     city: 'Chicago',
    state: 'IL',
      zip: '60601'
  },
  {
    address1: '3500 W 6th St #325',
    address2: 'City Center on 6th',
     city: 'Los Angeles',
    state: 'CA',
      zip: '90020'
  }
]

100.times do |i|
  User.create!(
    first_name: Faker::Name.first_name,
     last_name: Faker::Name.last_name,
     locations: [ Location.create!(locations[rand(locations.length-1)]) ],
      username: "#{Faker::Internet.user_name}#{i}",
      password: Faker::Internet.password(10),
         email: Faker::Internet.user_name + i.to_s +
                "@#{Faker::Internet.domain_name}"
  )
end

puts "users created"
