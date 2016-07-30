class UserCityRelation < ApplicationRecord
  belongs_to :user
  belongs_to :city
  validates :user_id, :city_id, presence: true
end
