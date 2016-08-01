# == Schema Information
#
# Table name: subregions
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  region_id  :integer
#

FactoryGirl.define do
  factory :subregion do
    name "NoVA"
    region
  end
end
