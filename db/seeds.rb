manhattan   = {
  line1: '224 west 4th street',
   city: 'New York',
  state: 'NY',
    zip: '10014'
}
brooklyn    = {
  line1: 'n 11211',
  line2: '178 n 8th St',
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
  line1: 'City Center on 6th',
  line2: '3500 W 6th St #325',
   city: 'Los Angeles',
  state: 'CA',
    zip: '90020'
}
locations = [
  Location.create!(address: Address.create!(manhattan)),
  Location.create!(address: Address.create!(brooklyn)),
  Location.create!(address: Address.create!(san_fran)),
  Location.create!(address: Address.create!(chicago)),
  Location.create!(address: Address.create!(los_angeles))
]

salons = [
  'Seagull Haircutters',
  'Cutler Salon',
  'Patrick Evan Salon',
  'XEX',
  'Etude Lounge'
]

salons.map!.with_index do |salon, index|
  Salon.create!(name: salon, locations: [ locations[index] ])
end

350_000.times do |i|
  User.create!(
    first_name: Faker::Name.first_name,
     last_name: Faker::Name.last_name,
     locations: [ locations[rand(locations.length-1)] ],
      username: "#{Faker::Internet.user_name}#{i}",
      password: Faker::Internet.password(10),
         email: Faker::Internet.user_name + i.to_s +
                "@#{Faker::Internet.domain_name}"
  )
end
