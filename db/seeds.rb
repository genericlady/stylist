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
locations = {
  los_angeles: Location.create!(address: Address.create!(los_angeles)),
    manhattan: Location.create!(address: Address.create!(manhattan)),
     brooklyn: Location.create!(address: Address.create!(brooklyn)),
     san_fran: Location.create!(address: Address.create!(san_fran)),
      chicago: Location.create!(address: Address.create!(chicago))
}

Salon.create! ({
       name: 'Seagull Haircutters',
  locations: [ locations[:manhattan] ]
})

Salon.create!({
       name: 'Cutler Salon',
  locations: [ locations[:brooklyn] ]
})

Salon.create!({
       name: 'Patrick Evan Salon',
  locations: [ locations[:san_fran] ]
})

Salon.create!({
       name: 'XEX',
  locations: [ locations[:chicago] ]
})

Salon.create!({
       name: 'Etude Lounge',
  locations: [ locations[:los_angeles] ]
})

350_000.times do |i|
  User.create!(
    first_name: Faker::Name.first_name,
     last_name: Faker::Name.last_name,
      username: "#{Faker::Internet.user_name}#{i}",
      password: Faker::Internet.password(10),
         email: Faker::Internet.user_name + i.to_s +
                "#{Faker::Internet.domain_name}"
  )
end
