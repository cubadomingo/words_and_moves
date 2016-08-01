# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  title       :string
#  body        :text
#  location    :string
#  event_date  :datetime
#  category_id :integer
#  city_id     :integer
#  user_id     :integer
#  region_id   :integer
#

FactoryGirl.define do
  factory :event do
    title "Test Event"
    body "Test Event Body"
    location "DC"
    event_date DateTime.now + 1.day
    category
    city
    user
  end
end
