FactoryGirl.define do
  factory :nails, class: Service do
    name 'Gel nails'
    description 'Best gel nails by lillique'
    price '$120'
  end

  factory :hair, class: Service do
    name 'Womens Haircut'
    description 'Great Womens haircut. really great.'
    price '$180'
  end

  factory :makeup, class: Service do
    name 'Makeup for weddings'
    description 'Amazingly over the top makeup that you will love to hate.'
    price '$199'
  end
end
