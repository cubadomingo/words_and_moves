# == Schema Information
#
# Table name: cities
#
#  id           :integer          not null, primary key
#  name         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  subregion_id :integer
#

FactoryGirl.define do
  factory :city do
    name "Oakland"
    subregion
  end
end
