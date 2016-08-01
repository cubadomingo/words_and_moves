# == Schema Information
#
# Table name: user_region_relations
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  region_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :user_region_relation do
    user 
    region 
  end
end
