# == Schema Information
#
# Table name: rsvps
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  event_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Rsvp < ApplicationRecord
  belongs_to :user
  belongs_to :event
end
