# == Schema Information
#
# Table name: posts
#
#  id    :integer          not null, primary key
#  title :string
#  body  :text
#

class Post < ActiveRecord::Base
end
