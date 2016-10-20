FactoryGirl.define do
  sequence :email do |n|
    "stylist#{n}@example.com"
  end
  
  sequence :username do |n|
    "user#{n}"
  end
  
  factory :user do
    first_name 'Sally'
    last_name 'Hansen'
    username generate(:username)
    password '1234567890'
    email
  end
end

# create(:user)
# build_stubbed(:user, :admin, :male, name: "John Doe")
