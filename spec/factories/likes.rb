# == Schema Information
#
# Table name: likes
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  item_type  :string
#  item_id    :integer
#

FactoryGirl.define do
  factory :like do
    user
    association :item, factory: :post
  end
end
