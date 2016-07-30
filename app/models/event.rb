# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :text
#  location   :string
#  event_date :datetime
#

class Event < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  belongs_to :city
  has_many :comments
  has_many :rsvps
  has_many :likes, as: :item
  has_many :dislikes, as: :item
  has_many :users, through: :rsvps

  def net_likes
    likes.count - dislikes.count
  end
end
