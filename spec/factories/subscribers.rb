FactoryGirl.define do
  factory :subscriber do
    sequence(:email) { |x| "test.user#{x}@gmail.com" }
  end
end
