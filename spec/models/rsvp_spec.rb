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

require 'rails_helper'

RSpec.describe Rsvp, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
