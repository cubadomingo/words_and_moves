FactoryGirl.define do
  factory :event do
    title "Test Event"
    body "Test Event Body"
    location "DC"
    event_date DateTime.now + 1.day
    category
    city
    user
  end
end