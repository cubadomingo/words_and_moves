FactoryGirl.define do
  factory :user do
    sequence(:email) { |x| "test.user.#{x}@wordsandmoves.com" }
    sequence(:username) { |x| "test.user.#{x}" }
    password "testpassword"
  end
end
