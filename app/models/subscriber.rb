# == Schema Information
#
# Table name: subscribers
#
#  id         :integer          not null, primary key
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Subscriber < ApplicationRecord
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_format_of :email, :with => /@/
end
