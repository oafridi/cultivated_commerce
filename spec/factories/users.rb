FactoryGirl.define do
  factory :user do
    first_name Faker::Name.name 
    email Faker::Internet.email
    password Faker::Internet.password(8)
  end

end
