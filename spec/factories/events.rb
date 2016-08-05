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
    venue "Rock N Roll Club"
    date Date.today + 1.day
    time Time.now
    category
    city
    user
  end
end
