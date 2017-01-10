FactoryGirl.define do
  sequence :email do |n|
    "stylist#{n}@example.com"
  end
  
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    username { Faker::Internet.user_name }
    password '1234567890'
    email

    factory :bob_from_brooklyn do
      first_name 'Bob'
      locations { [FactoryGirl.create(:brooklyn)] }
    end

    factory :betty_from_beverly_hills do
      first_name 'Betty'
      locations { [FactoryGirl.create(:beverly_hills)] }
    end

    factory :george_from_chicago do
      first_name 'George'
      locations { [FactoryGirl.create(:chicago)] }
    end

    factory :nick_from_new_york do
      first_name 'Nick'
      locations { [FactoryGirl.create(:new_york)] }
    end

    factory :sally_from_san_francisco do
      first_name 'Sally'
      locations { [FactoryGirl.create(:san_francisco)] }
    end

  end

end

# create(:user)
# build_stubbed(:user, :admin, :male, name: "John Doe")
