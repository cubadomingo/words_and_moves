FactoryGirl.define do
  factory :like do
    user
    association :item, factory: :post
  end
end
