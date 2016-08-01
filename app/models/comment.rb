# == Schema Information
#
# Table name: comments
#
#  id       :integer          not null, primary key
#  body     :string
#  user_id  :integer
#  event_id :integer
#  post_id  :integer
#

class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :event
  belongs_to :user
end
