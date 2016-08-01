# == Schema Information
#
# Table name: cities
#
#  id           :integer          not null, primary key
#  name         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  subregion_id :integer
#

class City < ApplicationRecord
  has_many :events
  belongs_to :subregion

  has_many :user_city_relations
  has_many :users, through: :user_city_relations
end
