# == Schema Information
#
# Table name: user_city_relations
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  city_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :user_city_relation do
    user
    city 
  end
end
