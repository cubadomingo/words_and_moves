class Subregion < ApplicationRecord
  has_many :cities
  has_many :events, through: :cities
  belongs_to :region
end
