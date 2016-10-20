FactoryGirl.define do
  factory :location do
    
  end
end
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
  {
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
