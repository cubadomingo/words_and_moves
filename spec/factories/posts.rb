# == Schema Information
#
# Table name: posts
#
#  id          :integer          not null, primary key
#  title       :string
#  body        :text
#  category_id :integer
#  region_id   :integer
#  user_id     :integer
#

FactoryGirl.define do
  factory :post do
    title "Test Title"
    body "Test body"
    category
    region
    user
  end
end
