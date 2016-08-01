# == Schema Information
#
# Table name: regions
#
#  id   :integer          not null, primary key
#  name :string
#  slug :string
#

class Region < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :posts
  has_many :events, through: :subregions
  has_many :subregions

  has_many :user_region_relations
  has_many :users, through: :user_region_relations
end
