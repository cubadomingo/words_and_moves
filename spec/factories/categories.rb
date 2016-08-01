# == Schema Information
#
# Table name: categories
#
#  id   :integer          not null, primary key
#  name :string
#

FactoryGirl.define do
  factory :category do
    sequence(:name) { |x| "Category #{x}"}
  end
end
