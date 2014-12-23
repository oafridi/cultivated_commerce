FactoryGirl.define do
  factory :user do
    first_name Faker::Name.name 
    email Faker::Internet.email
    address_line_1 "59 Yale Street"
    city "SF"
    zipcode 94134
    password Faker::Internet.password(8)
    latitude 37
    longitude 122
  end

end
