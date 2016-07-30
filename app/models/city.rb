class City < ApplicationRecord
  has_many :events
  belongs_to :subregion

  has_many :user_city_relations
  has_many :users, through: :user_city_relations
end
