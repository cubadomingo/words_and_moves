# == Schema Information
#
# Table name: posts
#
#  id          :integer          not null, primary key
#  title       :string
#  body        :text
#  category_id :integer
#  region_id   :integer
#  user_id     :integer
#

class Post < ActiveRecord::Base
  extend FriendlyId
  has_many :likes, as: :item
  has_many :dislikes, as: :item
  has_many :comments, as: :item
  belongs_to :region
  belongs_to :user
  belongs_to :category

  friendly_id :title, use: :slugged

   # creates a new like with item_id and user_id
  def like!(user)
    likes.create!(user_id: user.id)
  end

  # destroys a like with matching item_id and user_id
  def unlike!(user)
    like = likes.find_by(user.id)
    like.destroy!
  end

  # returns true of false if a post is liked by user
  def like?(user)
    likes.find_by_user_id(user.id)
  end

  # creates a new dislike with item_id and user_id
  def dislike!(user)
    dislikes.create!(user_id: user.id)
  end

  # destroys a dislike with matching item_id and user_id
  def undislike!(user)
    dislike = dislikes.find_by(user.id)
    dislike.destroy!
  end

  # returns true of false if a post is disliked by user
  def dislike?(user)
    dislikes.find_by_user_id(user.id)
  end

  def net_likes
    likes.count - dislikes.count
  end
end
