class City < ApplicationRecord
  has_many :events
  belongs_to :subregion
end
