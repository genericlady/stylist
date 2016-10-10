manhattan   = {
  line1: '224 west 4th street',
   city: 'New York',
  state: 'NY',
    zip: '10014'
}
brooklyn    = {
  line1: '178 n 8th St',
  line2: 'n 11211',
   city: 'Brooklyn',
  state: 'NY',
    zip: '11211'
}
san_fran    = {
  line1: '55 Grant Ave',
   city: 'San Francisco',
  state: 'CA',
    zip: '94108'
}
chicago     = {
  line1: '35 W Wacker Dr',
   city: 'Chicago',
  state: 'IL',
    zip: '60601'
}
los_angeles = {
  line1: '3500 W 6th St #325',
  line2: 'City Center on 6th',
   city: 'Los Angeles',
  state: 'CA',
    zip: '90020'
}

puts "locations created"

Salon.create!(
  name: 'Seagull Haircutters',
  locations: [ Location.create!(address: Address.create!(manhattan)) ]
)

Salon.create!(
  name: 'Cutler Salon',
  locations: [ Location.create!(address: Address.create!(brooklyn)) ]
)

Salon.create!(
  name: 'Patrick Evan Salon',
  locations: [ Location.create!(address: Address.create!(san_fran)) ]
)
Salon.create!(
  name: 'XEX',
  locations: [ Location.create!(address: Address.create!(chicago)) ]
)
Salon.create!(
  name: 'Etude Lounge',
  locations: [ Location.create!(address: Address.create!(los_angeles)) ]
)

puts "salons created"

100.times do |i|
  User.create!(
    first_name: Faker::Name.first_name,
     last_name: Faker::Name.last_name,
     locations: [Location.create!(address: Address.create!(brooklyn))],
      username: "#{Faker::Internet.user_name}#{i}",
      password: Faker::Internet.password(10),
         email: Faker::Internet.user_name + i.to_s +
                "@#{Faker::Internet.domain_name}"
  )
end

puts "users created"
