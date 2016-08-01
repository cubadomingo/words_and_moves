# == Schema Information
#
# Table name: subregions
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  region_id  :integer
#

class Subregion < ApplicationRecord
  has_many :cities
  has_many :events, through: :cities
  belongs_to :region
end
