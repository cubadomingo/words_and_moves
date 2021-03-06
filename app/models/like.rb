# == Schema Information
#
# Table name: likes
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  item_type  :string
#  item_id    :integer
#

class Like < ApplicationRecord
  belongs_to :user
  belongs_to :item, polymorphic: true
  validates :user_id, presence: true
  validates :user_id, uniqueness: { scope: :item_id }
end
