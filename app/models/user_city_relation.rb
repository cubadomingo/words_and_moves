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

class UserCityRelation < ApplicationRecord
  belongs_to :user
  belongs_to :city
  validates :user_id, :city_id, presence: true
end
