# == Schema Information
#
# Table name: regions
#
#  id   :integer          not null, primary key
#  name :string
#

class Region < ActiveRecord::Base
  has_many :posts
  has_many :subregions
end
