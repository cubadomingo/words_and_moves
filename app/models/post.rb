# == Schema Information
#
# Table name: posts
#
#  id    :integer          not null, primary key
#  title :string
#  body  :text
#

class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :region
  belongs_to :user
  belongs_to :category
end
