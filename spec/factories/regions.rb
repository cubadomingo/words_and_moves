# == Schema Information
#
# Table name: regions
#
#  id   :integer          not null, primary key
#  name :string
#  slug :string
#

FactoryGirl.define do
  factory :region do
    name "DC Metro"
  end
end
