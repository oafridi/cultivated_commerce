FactoryGirl.define do
  factory :listing do
    title "Test title"
    description "This is a test description!"
    quantity 3 
    association :item 
    association :user
  end
end
