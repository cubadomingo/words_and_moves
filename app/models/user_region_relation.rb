# == Schema Information
#
# Table name: user_region_relations
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  region_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class UserRegionRelation < ApplicationRecord
  belongs_to :user
  belongs_to :region
  validates :user_id, :region_id, presence: true
  validates :user_id, uniqueness: { scope: :region_id }
end
