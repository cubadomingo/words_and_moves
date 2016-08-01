# == Schema Information
#
# Table name: subscribers
#
#  id         :integer          not null, primary key
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :subscriber do
    sequence(:email) { |x| "test.user#{x}@gmail.com" }
  end
end
