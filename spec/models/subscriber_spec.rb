# == Schema Information
#
# Table name: subscribers
#
#  id         :integer          not null, primary key
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Subscriber, type: :model do
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
end
