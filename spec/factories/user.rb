FactoryGirl.define do
  factory :user do
    sequence(:email) { |x| "test.user.#{x}@wordsandmoves.com" }
    sequence(:username) { |x| "test.user.#{x}" }
    sequence(:first_name) { |x| "test#{x}" }
    sequence(:last_name) { |x| "user#{x}" }
    password "testpassword"
  end
end