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
  has_many :comments
  has_many :likes, as: :item
  has_many :dislikes, as: :item
  belongs_to :region
  belongs_to :user
  belongs_to :category

  def net_likes
    likes.count - dislikes.count
  end
end
