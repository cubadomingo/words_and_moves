FactoryGirl.define do
  factory :dislike do
    user
    association :item, factory: :post
  end
end
