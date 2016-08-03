# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  title       :string
#  body        :text
#  location    :string
#  event_date  :datetime
#  category_id :integer
#  city_id     :integer
#  user_id     :integer
#  region_id   :integer
#

class Event < ActiveRecord::Base
  extend FriendlyId
  belongs_to :category
  belongs_to :user
  belongs_to :city
  has_many :comments
  has_many :rsvps
  has_many :likes, as: :item
  has_many :dislikes, as: :item
  has_many :users, through: :rsvps

  friendly_id :slug_candidates, use: :slugged

  def slug_candidates
    [
      [:title, :location],
    ]
  end

  def net_likes
    likes.count - dislikes.count
  end
end
