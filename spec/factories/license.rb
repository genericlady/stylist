FactoryGirl.define do
  factory :license do
    image { File.new("#{Rails.root}/spec/support/fixtures/image.jpg") }
    expiration '12/11/2099'
  end
  factory :invalid_license do
  end
end
