FactoryGirl.define do
  factory :user do
    first_name Faker::Name.name
    last_name Faker::Name.name
    email Faker::Internet.email
    address_line_1 Faker::Address.street_address(include_secondary = false)
    city Faker::Address.city
    zipcode Faker::Address.zip_code
    password Faker::Internet.password(8)
    latitude Faker::Address.latitude.to_f
    longitude Faker::Address.longitude.to_f
  end

end
