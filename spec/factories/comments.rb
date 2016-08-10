FactoryGirl.define do
  factory :comment do
    user
    association :item, factory: :post
  end
end