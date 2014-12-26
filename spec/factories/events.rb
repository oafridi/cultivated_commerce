FactoryGirl.define do
  factory :event do
    address_line_1 Faker::Name.name
    city    Faker::Address.city
    zipcode Faker::Address.zip_code
    state   Faker::Address.state
    latitude Faker::Address.latitude.to_f
    longitude Faker::Address.longitude.to_f
    date = (0..200).to_a.sample.days.ago
    title Faker::
    description Faker::
  end
end
